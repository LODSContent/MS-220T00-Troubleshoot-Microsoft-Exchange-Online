# Lab 5 – Troubleshoot Authentication

## Lab scenario

Scenario here

## Lab Setup

**Note:** In this lab exercise, you'll partner with another student to exchange emails with. If you don't have a partner, you can exchange emails from a personal Microsoft Outlook email account (@outlook.com, @Hotmail.com, @live.com, etc.) with your tenant admin account, **admin@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the unique tenant prefix provided by your lab hosting provider)

## Instructions

### Task 1 - Create a Sensitivity Label

1. On **LON-CL1**, select **Ctrl+Alt+Delete** to sign-in. Sign-into **LON-CL1** as the local administrator account that was created by your lab hosting provider (**Administrator**) with the password **Pa55w.rd**.

2. 

3. 

4. 

5. 

6. 

7. 


1. navigate to the following URL: **<https://www.telerik.com/download/fiddler>**

1. On the left-hand side of the webpage appears, in the drop-down menu **How do you plan to use Fiddler?**, select **Client application development/debugging**.

1. In the **Your email** text box, enter **admin@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider).

1. In the drop-down menu for **Country/Territory**, select your country or territory.

1. If asked, in the drop-down mene for **State/Province**, select your state or province.

1.  Before checking the **I accept** check-box, please review the [Fiddler End User License Agreement](https://www.telerik.com/purchase/license-agreement/fiddler).

    **Important:** By selecting **I accept** you agree to Fiddler's License agreement.

1. Select **Download for Windows**

    **Note:** If prompted with a **CAPTCHA**, follow the steps to verify.

1. In the downloads pop-up, select **FIddlerSetup.exe**.

1. You will be prompted to again review and agree to license agreement for Fiddler Classic, carefully read it prior to selecting **I Agree**

    **Important:** By selecting **I agree** you agree to Fiddler's license agreement.

1. On the **Select the directory to install Progress Telerik Fiddler Classic**, leave the default destination folder and select **Install**.

1. Once installed, close out of the **First run** tab opened in **Microsoft Edge** and minimus your browser.

1. The install should show completed, select **Close**.

1. In the windows taskbar select the search icon and type in **Fiddler**.

1. In the search results, right-clock **Fiddler Classic** and select **Run as administrator**.

1. Once Fiddler opens, select **No** on the **AppContainer Configuration** prompt.

1. In Fiddler, select **File** from the menu and then select **Capture Traffic**.

    **Note:** You should see the check mark next to **Capture Traffic** disappear indicating traffic capture is no longer occurring.

1. In Fiddler, select **Tools** From the menu and then select **Options**.

1. In the Fiddler options prompt, select the **HTTPS** tab.

1. On the **HTTPS** tab, select **Decrypt HTTPS traffic**.

    **Note:** you will be prompted with a warning stating **SCARY TEXT AHEAD: Read Carefully!**. Select **Yes** to continue.

    ![Scary Text prompt](/Images/Scary_Text.png)

1. On the next **Security Warning** prompt, select **Yes**.

1. On the **Add certificate to the Machine Root List?**, select **Yes**.

     **Note:** once the root cert has been added, another prompt for **TrustCert Success** will be displayed. Select **OK** to exit the prompt.

1. Back on the Fiddler Options **HTTPS** tab, select **OK**.

1. You should now be back in the Fiddler application window. We first want to clear all previously captured traffic by selecting the **X** icon > **Remove all**.

     ![Remove All](/Images/Fiddler_removeall.png)

1. Next, we will configure Fiddler to only capture HTTPS traffic coming in and out of Outlook. First, in the windows task bar, select the **Outlook** icon.

     A new Outlook prompt asking to type in your **Email Address** Should appear. Do not type in you email / connect just yet.

    ![Outlook Prompt](/Images/Outlook_Prompt.png)

1. We now want to re-arrange the Fiddler application window and the Outlook prompt side by side:

    **Note:** It doesnt need to be perfect, we just want to have both windows displayed at the same time.

    ![Window Configuration](/Images/Side_by_side.png)

1. Inside of **Fiddler** select **AND HOLD** the **Any Process** Icon, then drag and drop the cross-hair icon onto the **Outlook** window.

    ![Fiddler Animation](/Images/FiddlerAnimation.gif)

    **Note:** The Outlook process ID (PID) in the GIF above, **outlook:9960**, wont match yours. the PID is a unique id given to every application on launch.

1. Leave both Outlook and Fiddler open before proceeding to the next task.

### Task # - sasas

