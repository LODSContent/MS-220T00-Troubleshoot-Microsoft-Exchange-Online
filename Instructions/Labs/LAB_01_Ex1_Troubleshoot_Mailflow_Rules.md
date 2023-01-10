# Lab 1 - Lab Introduction and setup

**insert body here** 

Your instructor will provide guidance on how to obtain your Microsoft 365 credentials in your lab-hosted environment. You will use these credentials throughout the remaining labs in this course.

In your lab environment, your lab hosting provider has already:

- Deployed the trial tenant
- Created a default tenant administrator account (known as the MOD Administrator)
- Created 9 additional user accounts

In order to configure Lab 1:

1. On **LON-CL1**, you must select **Ctrl+Alt+Delete** to log in (your instructor will guide you on how to find this option in your VM environment). Log into LON-CL1 as the local Adatum administrator account that was created by your lab hosting provider (**Administrator**) with the password **Pa55w.rd**.

2. Once logged into **LON-CL1**, open the folder on the desktop named **Lab Scripts** and then the subfolder named **Lab 1**. In the **Lab 1** subfolder a .bat file named **Lab1setup.bat** should exist.

    Right-click **Lab1setup.bat** and then select **Run as administrator** to start the lab setup process. 

    **Note:** If a **Windows protected your PC** pop-up warning is displayed, select **More info** and then select **Run anyway** at the bottum of the pop-up to continue. A **Lab 1 setup** window will appear on the screen.

3. After about 30 seconds (and up to 1 minute), a Microsoft Sign-on prompt will appear. Log in as **admin@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider). On the **Enter password** window, enter the tenant admin password provided by your lab hosting provider and then select **Sign in**.

    **Important:** The **Lab 1 setup** process has a time-out of 5 minutes. If you fail to type in your credentials within this 5 minute time frame, a pop-up message displaying **Lab Setup Failed. EXITING...** will appear. Click **Ok**, close the Microsoft Sign-on window, and repeat step 2. 

4. Once the lab setup process has completed, a pop-up message displaying **Lab Setup Completed. EXITING...** will appear. Select **Ok** and proceed to **Exercise 1, Task 1**

    **Note:** It could take the full 5 minute time-frame for the lab setup process to complete. 

## Excercise 1 - Troubleshoot Mailflow Rules

**Insert exc. intro here**

### Task 1 - Review a Non-Delivery Report Message

**insert task intro here**

1. You should still be logged into LON-CL1 as the **Administrator** with a password of **Pa55w.rd**; however, if the log-in page appears, then log in now

2. You will now access **Outlook for the Web** from LON-CL1. Select the **Microsoft Edge** icon from your taskbar and enther the following URL in the address bar: **<https://outlook.office.com/mail/>.**

3. On the **Sign in** page, enter **admin@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider), and then enter the tenant email password provided by your lab hosting provider on the **Enter password** page. Select **Sign in.**

4. On the **Stay signed in?** window, select the **Don’t show this again** check box and then select **Yes.**

5. You are now signed into MOD Administrators mailbox. You will begin by sending an email to a random user with the domain name **Contoso.com**. In the upper right hand corner, select **New mail**.

6. In the message pane that appears on the right-side of the screen, enter the following information:

    - To: enter **User220@contoso.com** (Instead of User, you can type whatever you'd like, so long as its followed by **@contoso.com**)

    - Subject: enter **This is a Test Email**

    - Message Body: Enter **this is a Test Email**

7. Select **Send**.

8. Within about 10-30 seconds, you will recieve a new email inside of the MOD Administrators inbox from **Microsoft Outlook** with the same subject used in step 6. Select this email to open the reading preview pane on the right. 

9. In the preview pane on the right-side of the screen, you will see the following information:

    ![Screenshot of Non-Delievery Report](/Images/NDR_Message.png)

