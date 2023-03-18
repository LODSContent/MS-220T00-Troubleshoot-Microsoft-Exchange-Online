# Lab 5 – Troubleshoot Authentication

## Lab scenario

In the labs for this course, you're taking on the role of Adatum Corporations Messaging Administrator. You've deployed Microsoft 365 in a virtualized lab environment, and you've been tasked with completing a pilot that tests various M365 & Exchange functionalities as they relate to Adatum's business requirements.

In this lab, you'll install and configure Fiddler classic, a web debugging proxy tool. With Fiddler Classic, you can monitor and inspect the HTTP and HTTPS traffic of various applications.

In this specific scenario, you'll use Fiddler Classic to help troubleshoot sign-on related errors in Microsoft Outlook related to the use of basic authentication.

## Lab Setup

The labs in this course have been prepared for a Microsoft Exchange deployment at Adatum Corporation. Adatum is running a Microsoft 365 cloud-only deployment. The lab environments have been specifically designed in this manner to give you experience managing Microsoft Exchange in a Microsoft 365 deployment. You'll be provided with one virtual machines and a Microsoft 365 tenant to complete the lab steps.

### Sign in to the lab virtual machines

The labs in this course will use one virtual machine:

- **LON-CL1:** A stand-alone Windows 11 client virtual machine with Microsoft 365 suite of apps pre-installed.

**Note:** Lab virtual machine sign-in instructions will be provided to you by your instructor.

**Important:** The exercises in the MS-220 labs are cloud-only deployments. A local administrator account has been created on the client VMs. You'll sign-into the VMs as a local administrator instead of a domain account. Following your sign-in, the desktop will indicate that you're logged in on **LON-CL1**

### Review installed applications

Once you signed in to the VM, observe the start menu, and verify following applications have been installed:

- Microsoft Outlook

### Review Microsoft 365 tenant

Besides the single VM, you'll also be provided with a Microsoft 365 tenant with the following highlights:

- Office 365 E5 with Enterprise Mobility + Security E5.

- 15 licenses in total with 5 available of 15 (10 used).

- One Global Administrator (MOD Administrator) and 9 standard users have been pre-created.

- **Note:** Microsoft 365 sign-in instructions will be provided to you by your instructor.

- The username of the Global Administrator (MOD Administrator) is **admin@xxxxxZZZZZZ.onmicrosoft.com**.

- **xxxxxZZZZZZ.onmicrosoft.com** - This is the domain associated with the Microsoft 365 tenant that was provided by the lab hosting provider. The first part of this domain name (xxxxxZZZZZZ) is the unique tenant ID provided by the lab hosting provider. The **xxxxxZZZZZZ** portion of the tenant ID, which is the tenant suffix ID, will be unique for each student.

    **IMPORTANT:** The instructions that are provided in the lab exercise for this course are based on the new Microsoft 365 admin center UI and not the classic UI.

### Configure Lab 5

1. On **LON-CL1**, select **Ctrl+Alt+Delete** to sign-in. Sign-into **LON-CL1** as the local administrator account that was created by your lab hosting provider (**Administrator**) with the password **Pa55w.rd**.

2. Once logged into **LON-CL1**, open the folder on the desktop named **Lab Scripts** and then the subfolder named **Lab 5**. In the **Lab 5** subfolder a .bat file named **Lab5setup.bat** should exist.

    Right-click **Lab5setup.bat** and then select **Run as administrator** to start the lab setup process.

    **Note:** If a **Windows protected your PC** pop-up warning is displayed, select **More info** and then select **Run anyway** at the bottom of the pop-up to continue. A **Lab 5 setup** window will appear on the screen.

3. After about 30 seconds (and up to 1 minute), a Microsoft Sign-on prompt will appear. Sign-in as **admin@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider). On the **Enter password** window, enter the tenant admin password provided by your lab hosting provider and then select **Sign in**.

    **Important:** The **Lab 5 setup** process has a time-out of 5 minutes. If you fail to type in your credentials within this 5 minute time frame, a pop-up message displaying **Lab Setup Failed. EXITING...** will appear. Select **Ok**, close the Microsoft Sign-on window, and repeat step 2.

4. Once the lab setup process has completed, a pop-up message displaying **Lab Setup Completed. EXITING...** will appear. Select **Ok** and proceed.

    **IMPORTANT:** It could take the full 5 minute time-frame for the lab setup process to complete.

## Instructions

### Task 1 - Download and Configure Progress Telerik Fiddler Classic

In this task, you'll download, install and configure Fiddler Classic.

1. On **LON-CL1**, select **Ctrl+Alt+Delete** to sign-in. Sign-into **LON-CL1** as the local administrator account that was created by your lab hosting provider (**Administrator**) with the password **Pa55w.rd**.

2. Navigate to the following URL: **<https://www.telerik.com/download/Fiddler>**

3. On the left-hand side of the webpage appears, in the drop-down menu **How do you plan to use Fiddler?**, select **Client application development/debugging**.

4. In the **Your email** text box, enter **admin@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider).

5. In the drop-down menu for **Country/Territory**, select your country or territory.

6. If asked, in the drop-down menu for **State/Province**, select your state or province.

7. Before checking the **I accept** check-box, please review the [Fiddler End User License Agreement](https://www.telerik.com/purchase/license-agreement/Fiddler).

    **Important:** By selecting **I accept** you agree to Fiddler's License agreement.

8. Select **Download for Windows**

    **Note:** If prompted with a **CAPTCHA**, follow the steps to verify.

9. In the downloads pop-up, select **FIddlerSetup.exe**.

10. You'll be prompted to again review and agree to license agreement for Fiddler Classic, carefully read it prior to selecting **I Agree**

    **Important:** By selecting **I agree** you agree to Fiddler's license agreement.

11. On the **Select the directory to install Progress Telerik Fiddler Classic**, leave the default destination folder and select **Install**.

12. Once installed, close out of the **First run** tab opened in **Microsoft Edge** and minimize your browser.

13. The install should show completed, select **Close**.

14. In the windows taskbar select the search icon and type in **Fiddler**.

15. In the search results, right-clock **Fiddler Classic** and select **Run as administrator**.

16. Once Fiddler opens, select **No** on the **AppContainer Configuration** prompt.

17. In Fiddler, select **File** from the menu and then select **Capture Traffic**.

    **Note:** You should see the check mark next to **Capture Traffic** disappear indicating traffic capture is no longer occurring.

18. In Fiddler, select **Tools** from the menu and then select **Options**.

19. In the Fiddler options prompt, select the **HTTPS** tab.

20. On the **HTTPS** tab, select **Decrypt HTTPS traffic**.

    **Note:** you'll be prompted with a warning stating **SCARY TEXT AHEAD: Read Carefully!**. Select **Yes** to continue.

    ![Scary Text prompt](/Images/Scary_Text.png)

21. On the next **Security Warning** prompt, select **Yes**.

22. On the **Add certificate to the Machine Root List?**, select **Yes**.

     **Note:** once the root cert has been added, another prompt for **TrustCert Success** will be displayed. Select **OK** to exit the prompt.

23. Back on the Fiddler Options **HTTPS** tab, select **OK**.

24. You should now be back in the Fiddler application window. We first want to clear all previously captured traffic by selecting the **X** icon > **Remove all**.

     ![Remove All](/Images/Fiddler_removeall.png)

25. Next, we'll configure Fiddler to only capture HTTPS traffic coming in and out of Outlook. First, in the windows task bar, select the **Outlook** icon.

     A new Outlook prompt asking to type in your **Email Address** Should appear. Don't type in your email / connect yet.

    ![Outlook Prompt](/Images/Outlook_Prompt.png)

26. We now want to rearrange the Fiddler application window and the Outlook prompt side by side:

    **Note:** It doesn't need to be perfect, we just want to have both windows displayed at the same time.

    ![Window Configuration](/Images/Side_by_side.png)

27. Inside of **Fiddler** select **AND HOLD** the **Any Process** Icon, then drag and drop the cross-hair icon onto the **Outlook** window.

    ![Fiddler Animation](/Images/FiddlerAnimation.gif)

    **Note:** The Outlook process ID (PID) in the GIF above, **outlook:9960**, wont match yours. the PID is a unique ID given to every application on launch.

28. Leave both Outlook and Fiddler open before proceeding to the next task.

### Task 2 - Review Authentication Behavior

In this task, you'll utilize Fiddler Classic to review and test the behavior of outlook when Basic Authentication is passed (rather than modern authentication) from client to server. Basic Authentication has been in the process of being deprecated, and many organizations have already switched to more secure authentication methods.

1. You should still be logged into **LON-CL1** as the **Administrator** with a password of **Pa55w.rd**; however, if the Windows sign-in page appears, then sign-in now.

    Both the **Fiddler** and **Outlook** apps should be open on **LON-CL1** with Fiddler connected to Outlooks Process ID (PID).

    If Fiddler isn't connected to Outlook, repeat steps  17 & 24-28 from task 1

2. After ensuring Fiddler is connected to Outlook's PID, in Fiddler, navigate to **File** and select **Capture traffic**.

    **Note:** A check-mark should appear to the left of **Capture traffic** indicating traffic is being captured.

3. Navigate back to the Outlook prompt and under **Email address** enter: **AllanD@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider) and then select **Connect**.

    **Note:** Over in Fiddler, you should now see some results populating. You'll also be prompted with a **Windows Security** prompt:

    ![Windows Security Prompt](/Images/Windows_security_prompt.png)

4. Up until this point in this lab series, all Microsoft 365 sign-in prompts have been utilizing **Modern Authentication**. The **Windows Security** prompt indicates that another form of authentication is being used (Basic, NTLM, Kerberos, Etc.). In this specific case, **Basic Authentication** is being used because ADAL was disabled from running against all office applications during the Lab 5 setup process.

    We'll now determine the behavior experienced when logging into outlook using **Basic Authentication**. In the **Windows Security** prompt, enter the password for Allan, which will be the same as your tenant password (used to sign into **MOD Administrator**) and then select **OK**.

5. The **Windows Security** prompt should briefly disappear and reappear requesting Allan's password once again. This time, type in Allan's password once more (same as your tenant password) and this time before selecting **OK**, enable **Remember my credentials**.

    **Note:** Even with **Remember my credentials**, we're repeatedly prompted for Allan's credentials. This effectively reproduces a credential loop issue.

6. Close out of the **Windows Security** prompt.

7. Close out of all **windows security** prompts that may appear.

8. A **Something went wrong** warning popup should display, select **X** to close the window.

    ![Something went wrong](/Images/Something_went_wrong.png)

    **Note:** Because not all lab VMs are created equally, you may experience variations of behavior performing steps 4-9, but ultimately the end result should remain the same; the Outlook profile fails to be created. You may also see behavior where the profile is created but fails to connect to Exchange Online:

    ![Microsoft Outlook Warning](/Images/Microsoft_Outlook_Warning.png)

9. Maximize the Fiddler application window.

10. In the Fiddler application, you should see multiple results displayed representing the various connection attempts performed by Outlook. Select the first **401** result with the URL of **../autodiscover/autodiscover.xml**.

11. On the right-hand side of the Fiddler window, select **Inspectors**.

12. While on the **Inspectors** tab, select **Raw** for both the Request and Response headers. Your screen should look similar to the following:

    ![Microsoft Outlook Warning](/Images/Fiddler_Inspectors.png)

    You should now have the first **401** result selected With Fiddler configured to view the request and response headers as raw text files. Take a moment to review all of its contents.

    This first **401** result is our authentication challenge, where the authentication headers dictate the type of authentication being used. In this case, **WWW-Authenticate: Basic Realm=''** should be displayed in the Response header (bottom section):

    ![Basic auth response header](/Images/Fiddler_basic.png)

13. Select the second **401** result with the same URL of **../autodiscover/autodiscover.xml**. Take a moment to review the results on the request header (top section). There should now be a new header labeled **Authorization** with a string populated as its value, for example: **Basic QWXSYW5EQE0zNjV4MJC0MTsKousTT...**

14. With the second **401** result still selected, take a moment to review the response header (bottom section) for any errors indicated.

    You should see the **X-AutoDiscovery-Error** header populated with a value similar to below:

    ![Basic auth blocked error](/Images/Fiddler_basic_blocked.png)

    The error **LiveIdBasicAuth:BasicAuthBlocked..** indicates that basic authentication is blocked in your organization as an authentication method. Because of this, authentication will always fail when basic auth is passed by the outlook client, which will result in endless credential prompts for the user.

15. Close out of the Fiddler application before proceeding to the next task.

    If Outlook is still open at this time, please close it now as well.

### Task 3 - Enable ADAL on Local PC

In this final lab task, you'll reenable the Microsoft Authentication Library (ADAL) which is needed to support the use of modern authentication and MFA.

1. You should still be logged into **LON-CL1** as the **Administrator** with a password of **Pa55w.rd**; however, if the Windows sign-in page appears, then sign-in now.

2. In the windows taskbar, select the search icon and type in **RegEdit**.

3. Right-click **Registry Editor** and select **Run as Administrator**.

4. Navigate to the following location: **HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\Common\Identity**

    ![RegEdit Identity location](/Images/Regedit.png)

5. Right-click **EnableADAL** and then select **Modify**.

6. Under **Value data** enter a value of **1**, then select **OK**.

7. Exit **RegEdit** by click the **X** located on the top right-hand corner of the window.

8. On the desktop, open the folder named **Lab Scripts** and then the subfolder named **Lab 5**.

9. In the **Lab 5** subfolder a .bat file named **ClearProfiles.bat** should exist. Right-click **ClearProfiles.bat** and select **Run as administrator**.

    Close out of file explorer.

10. In the windows taskbar, select the **Outlook** icon.

11. On the **New Profile** prompt, under **Profile Name** enter **Outlook1** and then select ok.

12. In the Outlook prompt that appears, under **Email address** enter: **AllanD@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider) and then select **Connect**.

    You should now see a Microsoft 365 sign-on prompt displayed like:

    ![M365 sign-on prompt](/Images/M365_signon.png)

13. In the Microsoft 365 sign-on prompt, enter the password for Allan, which will be the same as your tenant password (used to sign into **MOD Administrator**) and then select **OK**.

14. On the **stay signed in to all your apps** prompt, select **No, sign in to this app only**.

15. On the **Account successfully added** prompt, select **Done**.

16. Once Outlook opens up to Allan's mailbox, verify that the account is connected to Exchange at the bottom right-hand corner of the screen, which should display **Connected to: Microsoft Exchange**

    **Note**: It may take between 30-60 second before Outlook fully opens.

17. Congrats! You have successfully enabled ADAL to run locally on your VM client. ADAL is required to be running in order for Modern Authentication / Multi-Factor Authentication to work properly.

    You have now completed lab 5 and all labs in this course.

## End of lab 5
