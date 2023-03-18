# Lab 1 - Troubleshoot Mail Flow

## Lab scenario

In the labs for this course, you're taking on the role of Adatum Corporations Messaging Administrator. You've deployed Microsoft 365 in a virtualized lab environment, and you've been tasked with completing a pilot that tests various Microsoft 365 & Exchange functionalities as they relate to Adatum's business requirements.

In this lab, you'll be troubleshooting and identifying the potential root cause of Non-Delivery Reports (NDRs) that have been encountered during testing by one of your colleagues who shares the same administrative privileges and access as you. Your colleague has reported that they're experiencing NDRs when sending to specific external tenants, but they cannot remember which setting they may have configured to cause this behavior.

For this specific scenario, you'll be assisting your colleague in troubleshooting the issue by reviewing the settings and configurations related to email delivery. You'll be working with the Microsoft 365 admin center and Exchange admin center to identify any potential issues with the email routing and transport rules that may be causing the NDRs. By the end of the lab, you'll have a better understanding of how to troubleshoot and identify the root cause of NDRs.

By understanding the different components that can cause NDRs, you'll be better equipped to quickly identify and resolve any similar issues that may arise in the future. This will help to ensure that email communication remains reliable and efficient within your organization.

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

### Configure Lab 1

1. On **LON-CL1**, select **Ctrl+Alt+Delete** to sign-in. Sign-into **LON-CL1** as the local administrator account that was created by your lab hosting provider (**Administrator**) with the password **Pa55w.rd**.

2. Once logged into **LON-CL1**, open the folder on the desktop named **Lab Scripts** and then the subfolder named **Lab 1**. In the **Lab 1** subfolder a .bat file named **Lab1setup.bat** should exist.

    Right-click **Lab1setup.bat** and then select **Run as administrator** to start the lab setup process.

    **Note:** If a **Windows protected your PC** pop-up warning is displayed, select **More info** and then select **Run anyway** at the bottom of the pop-up to continue. A **Lab 1 setup** window will appear on the screen.

3. After about 30 seconds (and up to 1 minute), a Microsoft Sign-on prompt will appear. Sign-in as **admin@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider). On the **Enter password** window, enter the tenant admin password provided by your lab hosting provider and then select **Sign in**.

    **Important:** The **Lab 1 setup** process has a time-out of 5 minutes. If you fail to type in your credentials within this 5 minute time frame, a pop-up message displaying **Lab Setup Failed. EXITING...** will appear. Click **Ok**, close the Microsoft Sign-on window, and repeat step 2.

4. Once the lab setup process has completed, a pop-up message displaying **Lab Setup Completed. EXITING...** will appear. Select **Ok** and proceed.

    **IMPORTANT:** It could take the full 5 minute time-frame for the lab setup process to complete.

### Personal Email Account Setup

In this lab, you'll be partnering with another student to exchange emails with. However, If you don't have a partner, or are following the self-paced version of this course, you can exchange emails from a personal Microsoft Outlook email account (@outlook.com, @Hotmail.com, @live.com, etc.) with your tenant admin account, **admin@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the unique tenant prefix provided by your lab hosting provider).

If you don't have a Personal Microsoft Outlook email account, you can follow the steps below to configure one:

1. On **LON-CL1**, right-click the **Microsoft Edge** icon from your taskbar and select **New InPrivate Window**
2. To create a new account, navigate to the following URL: **<https://signup.live.com>**
3. On the **Create account** account window, type in a unique name followed by either **@Outlook.com** or **@Hotmail.com**( For example, **User1@Outlook.com**) and then select **Next**.
4. Once a unique email address has been accepted, you'll be prompted to **Create a password**. Enter a unique password that has at least 8 characters and contains at least two of the following: uppercase letters, lowercase letters, numbers, and symbols, and then select **Next**.

    **Important**: Before selecting **Next**, please be sure to review both the [Microsoft Services Agreement](https://www.microsoft.com/servicesagreement/default.aspx?azure-portal=true) and [Privacy and cookies statement](https://go.microsoft.com/fwlink/?LinkID=521839). By selecting **Next**, you choose to agree to Microsoft's service agreement.

5. On the **What's your name?** window, enter your full name (or if you'd prefer, fictitious information), and then select **Next**.
6. On the **What's your birthdate?** window, choose your **Country/region** and enter a **Birthdate**, then select **Next**.
7. On the **Create account** window, select **Next** and solve the generated puzzle.
8. On the **Stay signed in?** page, select **Yes**.
9. In a new **Microsoft Edge** tab, navigate to the URL: **<https://outlook.live.com/mail/>**.
10. Confirm you're able to sign-in to your new email account. Make note of your sign-in details for future lab tasks.

## Instructions

### Task 1 - Review a Non-Delivery Report Message

In this task, you'll use the default global admin to sign in to the Outlook for the web and review the Non-Delivery Report (NDR) identified by your administrator colleague. This task is a crucial first step in identifying any mail flow related issues as NDRs typically have verbose error messages and can influence your initial troubleshooting approach.

1. You should still be logged into **LON-CL1** as the **Administrator** with a password of **Pa55w.rd**; however, if the Windows sign-in page appears, then sign-in now.

2. You'll now access **Outlook for the Web** from LON-CL1. Select the **Microsoft Edge** icon from your taskbar and enter the following URL in the address bar: **<https://outlook.office.com/mail/>**.

3. On the **Sign in** page, enter **admin@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider), and then enter the tenant email password provided by your lab hosting provider on the **Enter password** page. Select **Sign in**.

4. On the **Stay signed in?** window, select the **Don’t show this again** check box and then select **Yes**.

5. You're now signed into MOD Administrators mailbox. You'll begin by sending an email to a random user with the domain name **Contoso.com**. In the upper left-hand corner, select **New mail**.

6. In the message pane that appears on the right-side of the screen, enter the following information:

    - To: enter **User1@contoso.com**

    - Subject: enter **This is a Test Email**

    - Message Body: Enter **This is a Test Email**

7. Select **Send**.

8. Within about 10-30 seconds, you'll receive a new email inside of the MOD Administrators inbox from **Microsoft Outlook** with the same subject used in step 6. Select this email to open the reading preview pane on the right.

9. In the preview pane on the right-side of the screen, you'll see a Non-Delivery Report (NDR) that looks similar to the following example:

    ![Screenshot of Non-Delivery Report](/Images/NDR_Message.png)

10. Take a few minutes reviewing the NDR in its entirety before proceeding to the next task.

### Task 2 - Analyze a Message Trace

In this task, you'll use the default global admin to sign in to the Exchange Admin Center (EAC) and initiate your first troubleshooting task of a performing a message trace and analyzing the results. Performing messages traces is a crucial task performed by Exchange Administrators to ensure mail flow is operational.  

1. You should still be logged into **LON-CL1** from the prior task with Outlook Web Mail still open inside of **Microsoft Edge**; if necessary, log back into **LON-CL1** as the **Administrator** with a password of **Pa55w.rd**.

2. With **Outlook for the Web** still open, At the top left-hand corner of the web-page, select the **App launcher** icon.

3. In the new pane that opens on the left, under **Apps** select **Admin**.

    **Note:** If prompted to sign in, enter **admin@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider), and then enter the tenant email password provided by your lab hosting provider on the **Enter password** page. Select **Sign in**.

    You can also directly navigate to the Microsoft 365 admin center by navigating to the following URL: **<https://admin.microsoft.com/>**.

4. In the **Microsoft 365 admin center**, select **Show all**.

5. Under the new list of Admin Centers that appears, select **Exchange**.

    A new tab will open inside of **Microsoft Edge** for The **Exchange Admin Center** (EAC).

6. in the **EAC**, on the left-hand navigation pane, select **Mail flow** and then **Message trace**.

7. On the **Message trace** page, the **Default queries** tab at the top of the page is displayed by default. In the list of queries and reports in this tab, select **Messages sent from my primary domain in the last day**.

8. In the **New message trace** pane that appears, the default values for the **Messages sent from my primary domain in the last day** query are displayed. You can control which messages are selected based on who sent and received the messages and how many days ago the messages were sent.  

     Starting with this default query as a template, you'll now customize its settings to create a custom query that checks for emails sent to the **Contoso.com** domain in the past day.  

    - You can customize the **Senders** field to search for messages that were sent from a specific domain. By default, the query will select messages sent from all user accounts in your Microsoft 365 tenant; that is, from all user accounts whose primary domain matches the tenant of **@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the unique tenant prefix provided by your lab hosting provider). Therefore, do NOT change this value.  

    - You can customize the **Recipients** field to search for messages that were sent to specific users. By default, the query will select messages sent to all recipients. However, we'll need to modify the query to only select messages sent to the domain **Contoso.com**. Therefore, enter ***@Contoso.com** in the **Recipients** field, and then in the menu of users & Domains that appear, select ***@Contoso.com**

         **Note:** Using asterisk (*) will act as a wildcard, meaning the message trace will scan for all emails sent to any user with the domain **@Contoso.com**. You could alternatively search for a specific user like **User220@Contoso.com** for more specific results.

9. To avoid issues with the starting time for the search, on the **Time range** slider tool, drag the slider to the left so that it specifies sometime in the **Last 2 days** (actually, you can select any value greater than 1 day).

10. Under the **Report type** section, select the **Summary Report** option and then select **Save**.

    **Note:** Under most circumstances, a summary report will outline all necessary details. In some scenarios, like a message sent over 10 days ago, an extended or enhanced summary will need to be used (downloadable .CSV).

11. In the dialog box that appears, change the **Name** of the report to **Messages sent to Contoso.com in the past day**, select **Save**, and then select **Done**.

12. In the **New message trace** pane, select the **X** in the upper right-hand corner to close the pane.

13. On the **Message trace** window, select the **Custom queries** tab. Note how it includes the **Messages sent to Contoso.com in the past day** query that you created. This custom query can now be run at any time in the future.  

    Since we want to use this custom query, select the **Messages sent to Contoso.com in the past day** query (select the **Name** and not the circle with the check mark to the left of the name).

14. In the **New message trace** window, note how the query values are prefilled for you. Select **Search**.

15. On the **Message trace search results** page, you should see a single line item with a status of **Failed**. Select the report to view more details.

16. A new pane with the title **This is a Test Email** will appear.

    **Note:** the title of this pane should match whatever subject you used when sending the original email back in Task 1 step 6.

    Scroll down and expand **Message events** to show more details. Take a few minutes to expand each event and its results.

17. With the Message events still expanded, the last event should look similar to:

    ![Screenshot of Message events](/Images/Message_events.png)

    Notice the results indicate that a transport rule named **Rule 1** was identified. Make note of the ID (GUID).

18. Select the **X** in the **This a Test Email** pane to exit the message trace details - you can leave the **EAC** open for now. Then proceed to Task 3.

### Task 3 - Review Transport Rules

In previous tasks you identified that a mail flow was blocking messages during transport. In this task you'll review the configuration settings for this rule using the Exchange PowerShell Module. You'll then modify potential configuration issues using the Exchange Admin Center (EAC). Both PowerShell and The (EAC) can be used to perform both tasks, however the goal is to expose you to both options as an administrator will use them routinely to perform day to day tasks.

1. You should still be logged into **LON-CL1** from the prior task; if necessary, log back in as the **Administrator** with a password of **Pa55w.rd**.

2. Once logged into **LON-CL1**, open an elevated instance of **Windows PowerShell**. Select the magnifying glass (Search) icon on the taskbar at the bottom of the screen and type **powershell** in the Search box that appears. In the list of search results, right-click on **Windows PowerShell** (do NOT select Windows PowerShell ISE) and select **Run as administrator** in the drop-down menu.

3. Maximize your PowerShell window. In Windows PowerShell, at the command prompt, type the following command and press **Enter**:

      `Install-Module -Name ExchangeOnlineManagement`

    **Note:** During the initial lab setup (script) ran at the beginning of this exercise, the Exchange Online Management Module was installed. However, to familiarize yourself with the install process, we're outlining the detailed steps to manually install it. You may receive a warning that this module is already installed - ignore this.

4. You might be prompted "NuGet provider is required to continue", enter [Y] Yes [N] No [S] Suspend [?], enter **Y** to select **[Y] Yes**

5. If you're prompted to confirm whether you want to install the module from an untrusted repository (PSGallery), enter **A** to select **[A] Yes to All**.

6. At the command prompt, type the following command and press **Enter**:

     `Connect-ExchangeOnline`

7. A **Microsoft 365 Sign in** window will appear. Enter in the username for the **Mod Administrator** account provided by your learning provider (admin@M365xZZZZZZ.onmicrosoft.com) and then select **Next**.

8. In the **Enter password** window, enter the password for this admin account provided by your learning provider, and then select **Sign in**. It may take a moment to sign in before it returns a command prompt.

9. At the command prompt, type the following command and press **Enter**:

      `Get-TransportRule | FT Name, Guid`

     Several transport rules should be displayed. Verify that **Rule 1** corresponds with the GUID (ID) collected earlier in Task 2 step 17.

10. After verifying the GUID is a match for **Rule 1**, at the command prompt type the following and hit **enter**:

      `Get-TransportRule -Identity "Rule 1" | FL`

      Take a few minutes to review the commands output for configuration details.

11. After reviewing the configuration output within PowerShell for **Rule 1**, we should now have an idea on *why* our message sent to a user within the domain **Contoso.com** was blocked. Specifically, the following values tell us important configuration information:

    ![Screenshot of Get-TransportRule Output](/Images/Get_TransportRule_Output.png)

    In the current configuration, if any email address contains the words **Contoso.com** it will be reject in transport. When administrating a large organization its always important to fully understand the implications transport rules may have on your business. When in doubt, you can use the test functionality. This way, if you accidentally create a condition that doesn't do exactly what you want or interacts with other rules in unexpected ways, you won't have any unintended consequences. For more information, see [Test mail flow rules in Exchange Online](https://learn.microsoft.com/exchange/security-and-compliance/mail-flow-rules/test-mail-flow-rules?azure-portal=true).

12. We'll now switch from PowerShell to the **Exchange Admin Center** to view the Rules user interface.

    Close the PowerShell window and then select the **Microsoft Edge** icon on the taskbar. The **EAC** should open up to the **Message trace search results** page.

    If you exited out of **Microsoft Edge** previously, in a new tab, enter **<https://admin.exchange.microsoft.com/>**.

    If prompted, Sign-in with the tenant email account provided (**admin@xxxxxZZZZZZ.onmicrosoft.com**, where xxxxxZZZZZZ is your unique tenant prefix provided by your lab hosting provider) and the tenant password provided (Found under the resources tab in the VMs instruction pane).

13. On the left-hand navigation pane in the **EAC**, select **Mail flow** and then select **Rules**.

14. On the **Rule** page that is displayed, Notice the same list of Rules are displayed in the UI that were also output within PowerShell.

    Select **Rule 1**.

15. On the **Rule 1** details page that appears on the right, take a moment to review the details. They should match what we saw when reviewing the rule within PowerShell.

16. To resolve our transport issue, we'll now disable **Rule 1** by selecting the slider under **Enable or disable rule**.

    The rule should now show as disabled. Select the **X** at the top right-hand corner of the rule details page to exit.

    Back on the **Rules** page, **Rule 1** should now show a status of **Disabled**.

    You can now close the **Exchange admin center** tab in your **Microsoft Edge** browser. 

17. Navigate back to the **Microsoft 365 admin center** by click The **Home - Microsoft 365 admin center** tab that should still be open in your **Microsoft Edge** browser.

18. Select the **App Launcher** icon at the top left hand corner of the web page and then select the **Outlook** icon under the **Apps** header.

19. Once you're back in **Outlook**, repeat steps 2-7 from task 1 to ensure mail flow is now resolved to **Contoso.com**

## End of lab 1
