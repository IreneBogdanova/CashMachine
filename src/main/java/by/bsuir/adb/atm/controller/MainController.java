package by.bsuir.adb.atm.controller;

import by.bsuir.adb.atm.entity.ClientCardEntity;
import by.bsuir.adb.atm.service.AccountService;
import by.bsuir.adb.atm.service.ClientCardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;

@Controller
public class MainController {

    @Resource
    ClientCardService clientCardService;
    @Resource
    AccountService accountService;

    @RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.HEAD})
    public String getNewDepositPage(ModelMap model) {
        return "index";
    }

    @RequestMapping(value = "/enterCard", method = RequestMethod.POST)
    public String enterCard(ModelMap model, String cardNumber) {
        ClientCardEntity card = clientCardService.getCardByNumber(cardNumber);
        if(card!=null){
            if(card.getStatus()==(byte)0){
                model.addAttribute("error", "Ваша карточка заблокирована. Попробуйте вставить другую карточку");
                return "index";
            }
            String password = card.getPassword();
            model.addAttribute("pass", password);
            model.addAttribute("cardNum", cardNumber);
            model.addAttribute("tryNum", "3");
        }else{
            model.addAttribute("error", "Такой карточки не зарегестрированно в системе. Попробуйте вставить другую карточку");
            return "index";
        }
        return "enterPin";
    }

    @RequestMapping(value = "/pin", method = RequestMethod.POST)
    public String enterPin(ModelMap model,
                           String password, String verification, String cardNum, String tryNum,
                           String nextPage) {
        String page = "";
        int tryNumber = Integer.parseInt(tryNum);
        if (password.equals(verification)) {
            model.addAttribute("cardNum", cardNum);
            if (nextPage.isEmpty()) {
                page = "operations";

            } else if (nextPage.equals("balance")) {
                ClientCardEntity card = clientCardService.getCardByNumber(cardNum);
                String balance = card.getAccountByAccountId().getDebit().toString();
                model.addAttribute("balance", balance);
                page = "balance";

            } else if (nextPage.equals("getMoney")) {
                page = "getMoney";
            }

        } else {
            if (tryNumber == 1) {
                page = "index";
                clientCardService.blockCard(cardNum);
            } else {
                tryNumber--;
                model.addAttribute("pass", verification);
                model.addAttribute("cardNum", cardNum);
                model.addAttribute("tryNum", tryNumber);
                model.addAttribute("error", "Неверный пароль");
                page = "enterPin";
            }
        }
        return page;
    }

    @RequestMapping(value = "/operations", method = RequestMethod.POST)
    public String getOperationsPage(ModelMap model, String cardNum) {
        model.addAttribute("cardNum", cardNum);
        return "operations";
    }

    @RequestMapping(value = "/balance", method = RequestMethod.GET)
    public String getBalancePage(ModelMap model, String cardNum) {
        enterCard(model, cardNum);
        model.addAttribute("nextPage", "balance");
        return "enterPin";
    }


    @RequestMapping(value = "/getMoney", method = RequestMethod.GET)
    public String getMoneyPage(ModelMap model, String cardNum) {
        enterCard(model, cardNum);
        model.addAttribute("nextPage", "getMoney");
        return "enterPin";
    }

    @RequestMapping(value = "/getMoney", method = RequestMethod.POST)
    public String getMoney(ModelMap model, String cardNum, String sum) {
        Boolean isGet = accountService.getMoney(cardNum, sum);
        model.addAttribute("cardNum", cardNum);
        if (!isGet) {
            model.addAttribute("error", "Недостаточно средств на счете");
            return "getMoney";
        } else {
            model.addAttribute("sum", sum);
            return "check";
        }
    }
}