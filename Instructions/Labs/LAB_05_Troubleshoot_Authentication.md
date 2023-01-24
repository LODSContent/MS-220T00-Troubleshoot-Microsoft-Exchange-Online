# Lab 5 – Troubleshoot Authentication

## Lab scenario

Scenario here

## Lab Setup

**Note:** In this lab exercise, you'll partner with another student to exchange emails with. If you don't have a partner, you can exchange emails from a personal Microsoft Outlook email account (@outlook.com, @Hotmail.com, @live.com, etc.) with your tenant admin account, **admin@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the unique tenant prefix provided by your lab hosting provider)

## Instructions

### Task 1 - Configure Progress Telerik Fiddler Classic App

1. On **LON-CL1**, select **Ctrl+Alt+Delete** to sign-in. Sign-into **LON-CL1** as the local administrator account that was created by your lab hosting provider (**Administrator**) with the password **Pa55w.rd**.

2. navigate to the following URL: **<https://www.telerik.com/download/fiddler>**

3. On the left-hand side of the webpage appears, in the drop-down menu **How do you plan to use Fiddler?**, select **Client application development/debugging**.

4. In the **Your email** text box, enter **admin@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider).

5. In the drop-down menu for **Country/Territory**, select your country or territory.

6. If asked, in the drop-down mene for **State/Province**, select your state or province.

7. Before checking the **I accept** check-box, please review the [Fiddler End User License Agreement](https://www.telerik.com/purchase/license-agreement/fiddler).

    **Important:** By selecting **I accept** you agree to Fiddler's License agreement.

8. Select **Download for Windows**

    **Note:** If prompted with a **CAPTCHA**, follow the steps to verify.

9. In the downloads pop-up, select **FIddlerSetup.exe**.

10. You will be prompted to again review and agree to license agreement for Fiddler Classic, carefully read it prior to selecting **I Agree**

    **Important:** By selecting **I agree** you agree to Fiddler's license agreement.

11. On the **Select the directory to install Progress Telerik Fiddler Classic**, leave the default destination folder and select **Install**.

12. Once installed, close out of the **First run** tab opened in **Microsoft Edge** and minimus your browser.

13. The install should show completed, select **Close**.

14. In the windows taskbar select the search icon and type in **Fiddler**.

15. In the search results, right-clock **Fiddler Classic** and select **Run as administrator**.

16. Once Fiddler opens, select **No** on the **AppContainer Configuration** prompt.

17. In Fiddler, select **File** from the menu and then select **Capture Traffic**.

    **Note:** You should see the check mark next to **Capture Traffic** disappear indicating traffic capture is no longer occurring.

18. In Fiddler, select **Tools** From the menu and then select **Options**.

19. In the Fiddler options prompt, select the **HTTPS** tab.

20. On the **HTTPS** tab, select **Decrypt HTTPS traffic**.

    **Note:** you will be prompted with a warning stating **SCARY TEXT AHEAD: Read Carefully!**. Select **Yes** to continue.

    ![Scary Text prompt](/Images/Scary_Text.png)

21. On the next **Security Warning** prompt, select **Yes**.

22. On the **Add certificate to the Machine Root List?**, select **Yes**.

     **Note:** once the root cert has been added, another prompt for **TrustCert Success** will be displayed. Select **OK** to exit the prompt.

23. Back on the Fiddler Options **HTTPS** tab, select **OK**.

24. You should now be back in the Fiddler application window. We first want to clear all previously captured traffic by selecting the **X** icon > **Remove all**.

     ![Remove All](/Images/Fiddler_removeall.png)

25. Next, we will configure Fiddler to only capture HTTPS traffic coming in and out of Outlook. First, in the windows task bar, select the **Outlook** icon.

     A new Outlook prompt asking to type in your **Email Address** Should appear. Do not type in you email / connect just yet.

    ![Outlook Prompt](/Images/Outlook_Prompt.png)

26. We now want to re-arrange the Fiddler application window and the Outlook prompt side by side:

    **Note:** It doesnt need to be perfect, we just want to have both windows displayed at the same time.

    ![Window Configuration](/Images/Side_by_side.png)

27. Inside of **Fiddler** select **AND HOLD** the **Any Process** Icon, then drag and drop the cross-hair icon onto the **Outlook** window.

    ![Fiddler Animation](/Images/FiddlerAnimation.gif)

    **Note:** The Outlook process ID (PID) in the GIF above, **outlook:9960**, wont match yours. the PID is a unique id given to every application on launch.

28. Leave both Outlook and Fiddler open before proceeding to the next task.

### Task - Review Basic Authentication Behavior

1. You should still be logged into **LON-CL1** as the **Administrator** with a password of **Pa55w.rd**; however, if the Windows sign-in page appears, then sign-in now.

    Both the **Fiddler** and **Outlook** apps should be open on **LON-CL1** with Fiddler connected to Outlooks Process ID (PID).

    If Fiddler is not connected to Outlook, repeat steps  17 & 24-28 from task 1

2. After ensuring Fiddler is connected to Outlook's PID, in Fiddler, navigate to **File** and select **Capture traffic**.

    **Note:** A check-mark should appear to the left of **Capture traffic** indicating traffic is being captured.

3. Navigate back to the Outlook prompt and under **Email address** enter: **AllanD@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider) and then select **Connect**.

    **Note:** Over if fiddler, you should now see some results populating. You will also be prompted with a **Windows Security** prompt:

    ![Windows Security Prompt](/Images/Windows_security_prompt.png)

4. Up until this point in this lab series, all Microsoft 365 sign-in prompts have been utilizing **Modern Authentication**. The **Windows Security** prompt indicates that another form of authentication is being used (Basic, NTLM, Kerberos, Etc.). In this specific case, **Basic Authentication** is being used because ADAL was disabled from running against all office applications during the Lab 5 setup process.

    We will now determine the behavior experienced when logging into outlook using **Basic Authentication**. In the **Windows Security** prompt, enter the password for Allan, which will be the same as your tenant password (used to sign into **MOD Administrator**) and then select **OK**.

5. The **Windows Security** prompt should briefly disappear and re-appear requesting Allan's password once again. This time, type in Allan's password once more (same as your tenant password) and this time before selecting **OK**, enable **Remember my credentials**.

    **Note:** Even with **Remember my credentials**, we are repeatedly prompted for Allan's credentials. This effectively reproduces a credential loop issue.

6. Close out of the **Windows Security** prompt.

7. Back in the Account creation prompt for Outlook, you will see **Account successfully added**, which in this case a false positive. Select **Done**. 

8. Close out of all **windows security** prompts that may appear.

9. A **Microsoft Outlook** warning popup should display, select **OK**

    ![Microsoft Outlook Warning](/Images/Microsoft_Outlook_warning.png)

    **Note:** Because not all lab VM's are created equally, you may experience variations of behavior performing steps 4-9, but ultimately the end result should remain the same; the Outlook profile is created, but fails to load because we cannot connect to exchange or profile creation fails altogether because we cannot connect to exchange.

10. Maximize the fiddler application window.

11. In the Fiddler application, you should see multiple results displayed representing the various connection attempts performed by Outlook. Expand the **URL** column to see the entire URL of the HTTPS requests. 