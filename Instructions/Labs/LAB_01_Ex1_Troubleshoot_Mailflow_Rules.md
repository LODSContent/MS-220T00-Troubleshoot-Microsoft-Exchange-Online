# Lab 1 - Lab Introduction and setup

**insert body here** 

Your instructor will provide guidance on how to obtain your Microsoft 365 credentials in your lab-hosted environment. You will use these credentials throughout the remaining labs in this course.

In your lab environment, your lab hosting provider has already:

- Deployed the trial tenant
- Created a default tenant administrator account (known as the MOD Administrator)
- Created 9 additional user accounts

In order to configure Lab 1:

1. On **LON-CL1**, you must select **Ctrl+Alt+Delete** to log in. Log into **LON-CL1** as the local Adatum administrator account that was created by your lab hosting provider (**Administrator**) with the password **Pa55w.rd**.

2. Once logged into **LON-CL1**, open the folder on the desktop named **Lab Scripts** and then the subfolder named **Lab 1**. In the **Lab 1** subfolder a .bat file named **Lab1setup.bat** should exist.

    Right-click **Lab1setup.bat** and then select **Run as administrator** to start the lab setup process. 

    **Note:** If a **Windows protected your PC** pop-up warning is displayed, select **More info** and then select **Run anyway** at the bottum of the pop-up to continue. A **Lab 1 setup** window will appear on the screen.

3. After about 30 seconds (and up to 1 minute), a Microsoft Sign-on prompt will appear. Log in as **admin@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider). On the **Enter password** window, enter the tenant admin password provided by your lab hosting provider and then select **Sign in**.

    **Important:** The **Lab 1 setup** process has a time-out of 5 minutes. If you fail to type in your credentials within this 5 minute time frame, a pop-up message displaying **Lab Setup Failed. EXITING...** will appear. Click **Ok**, close the Microsoft Sign-on window, and repeat step 2. 

4. Once the lab setup process has completed, a pop-up message displaying **Lab Setup Completed. EXITING...** will appear. Select **Ok** and proceed to **Exercise 1, Task 1**

    **Note:** It could take the full 5 minute time-frame for the lab setup process to complete. 

## Excercise 1 - Troubleshoot Mailflow

**Insert exc. intro here**

### Task 1 - Review a Non-Delivery Report Message

**insert task intro here**

1. You should still be logged into **LON-CL1** as the **Administrator** with a password of **Pa55w.rd**; however, if the log-in page appears, then log in now.

2. You will now access **Outlook for the Web** from LON-CL1. Select the **Microsoft Edge** icon from your taskbar and enter the following URL in the address bar: **<https://outlook.office.com/mail/>**.

3. On the **Sign in** page, enter **admin@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider), and then enter the tenant email password provided by your lab hosting provider on the **Enter password** page. Select **Sign in**.

4. On the **Stay signed in?** window, select the **Don’t show this again** check box and then select **Yes**.

5. You are now signed into MOD Administrators mailbox. You will begin by sending an email to a random user with the domain name **Contoso.com**. In the upper left-hand corner, select **New mail**.

6. In the message pane that appears on the right-side of the screen, enter the following information:

    - To: enter **User@contoso.com** 

    - Subject: enter **This is a Test Email**

    - Message Body: Enter **this is a Test Email**

7. Select **Send**.

8. Within about 10-30 seconds, you will recieve a new email inside of the MOD Administrators inbox from **Microsoft Outlook** with the same subject used in step 6. Select this email to open the reading preview pane on the right. 

9. In the preview pane on the right-side of the screen, you will see a Non-Delivery Report (NDR) that looks similar to the following example:

    ![Screenshot of Non-Delievery Report](/Images/NDR_Message.png)

10. Take a few minutes reviewing the NDR in its entierity before proceededing to the next task.

### Task 2 - Analyze a Message Trace

**Task 2 intro here**

1. You should still be logged into **LON-CL1** from the prior task with Outlook Web Mail still open inside of Microsoft Edge; if necessary, log back into **LON-CL1** as the **Administrator** with a password of **Pa55w.rd**.

2. With **Outlook for the Web** still open, At the top left-hand corner of the web-page, select the **App launcher** icon.

3. In the new pane that opens on the left, under **Apps** select **Admin**.

    **Note:** If prompted to sign in, enter **admin@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider), and then enter the tenant email password provided by your lab hosting provider on the **Enter password** page. Select **Sign in**.

    You can also directly navigate to the Microsoft 365 Admin center by navigating to the following URL: **<https://admin.microsoft.com/>**.

4. In the **Microsoft 365 Admin Center**, select **Show all**.

5. Under the new list of Admin Centers that appears, select **Exchange**.

    A new tab will open inside of edge for The **Exchange Admin Center** (EAC). 

6. in the **EAC**, on the left-hand navigation pane, select **Mail flow** and then **Message trace**.

7. On the **Message trace** page, the **Default queries** tab at the top of the page is displayed by default. In the list of queries and reports in this tab, select **Messages sent from my primary domain in the last day**.

8. In the **New message trace** pane that appears, the default values for the **Messages sent from my primary domain in the last day** query are displayed. You can control which messages are selected based on who sent and received the messages and how many days ago the messages were sent.  

     Starting with this default query as a template, you will now customize its settings to create a custom query that checks for emails sent to the **Contoso.com** domain in the past day.  

    - You can customize the **Senders** field to search for messages that were sent from a specific domain. By default, the query will select messages sent from all user accounts in your Microsoft 365 tenant; that is, from all user accounts whose primary domain matches the tenant of **@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the unique tenant prefix provided by your lab hosting provider). Therefore, do NOT change this value.  

     - You can customize the **Recipients** field to search for messages that were sent to specific users. By default, the query will select messages sent to all recipients. However, we will need to modify the query to only select messages sent to the domain **Contoso.com**. Therefore, enter ***@Contoso.com** in the **Recipients** field, and then in the menu of users & Domains that appears, select ***@Contoso.com**

         **Note:** Using asterisk (*) will act as a wildcard, meaning the message trace will scan for all emails sent to any user with the domain **@Contoso.com**. You could alternatively search for a specific user like **User220@Contoso.com** for more specific results. 

9. To avoid issues with the starting time for the search, on the **Time range** slider tool, drag the slider to the left so that it specifies sometime in the **Last 2 days** (actually, you can select any value greater than 1 day).

10. Under the **Report type** section, select the **Summary Report** option and then select **Save**.

    **Note:** Under most circumstances, a summary report will outline all necessary details. In some scenarios, like a message sent over 10 days ago, an extended or enhanced summary will need to be used (downloadable .CSV).

11. In the dialog box that appears, change the **Name** of the report to **Messages sent to Contoso.com in the past day**, select **Save**, and then select **Done**.

12. In the **New message trace** pane, select the **X** in the upper right-hand corner to close the pane.

13. On the **Message trace** window, select the **Custom queries** tab. Note how it includes the **Messages sent to Contoso.com in the past day** query that you just created. This custom query can now be run at any time in the future.  

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

**Task 3 intro here**

1. You should still be logged into **LON-CL1** from the prior task; if necessary, log back in as the **Administrator** with a password of **Pa55w.rd**.

2. Once logged into **LON-CL1**, open an elevated instance of **Windows PowerShell**. Select the magnifying glass (Search) icon on the taskbar at the bottom of the screen and type **powershell** in the Search box that appears. In the list of search results, right-click on **Windows PowerShell** (do NOT select Windows PowerShell ISE) and select **Run as administrator** in the drop-down menu.

3. Maximize your PowerShell window. In Windows PowerShell, at the command prompt, type the following command and press Enter:

      `Install-Module -Name ExchangeOnlineManagement`

    **Note:** Durring the initial lab setup (script) ran at the beginning of this exercise, the Exchange Online Management Module was installed. However, to familiarize yourself with the install process, we are outlining the detailed steps to manually install it. You may receieve a warning that this module is already installed - ignore this.

4. You might be prompted "NuGet provider is required to continue", enter [Y] Yes [N] No [S] Suspend [?], enter **Y** to select **[Y] Yes**

5. If you are prompted to confirm whether you want to install the module from an untrusted repository (PSGallery), enter **A** to select **[A] Yes to All**.

6. At the command prompt, type the following command and press Enter:

     `Connect-ExchangeOnline`

7. A **Microsoft 365 Sign in** window will appear. Enter in the username for the **Mod Administrator** account provided by your learning provider (admin@M365xZZZZZZ.onmicrosoft.com) and then select **Next**.

8. In the **Enter password** window, enter the password for this admin account provided by your learning provider, and then select **Sign in**. It may take a moment to sign in before it returns a command prompt.

9. At the command prompt, type the following command and press Enter:

      `Get-TransportRule | FT Name, Guid`   

     Several transport rules should be displayed. Verify that **Rule 1** corresponds with the GUID (ID) collected earlier in Task 2 step 17.

10. After verifying the GUID is a match for **Rule 1**, at the command prompt type the following and hit enter:

      `Get-TransportRule -Identity "Rule 1" | FL` 

      Take a few minutes to review the commands output for configuration details.

11. After reviewing the configuration output within PowerShell for **Rule 1**, we should now have an idea on *why* our message sent to a user within the domain **Contoso.com** was blocked. Specifically, the following values tell us important configuration information:

    ![Screenshot of Get-TransportRule Output](/Images/Get_TransportRule_Output.png)

    In the current configuration, if any email address constains the words **Contoso.com** it will be reject in transport. When administarting a large organization its always important to fully understand the implications transport rules may have on your business. When in doubt, you can use the test functionality. This way, if you accidentally create a condition that doesn't do exactly what you want or interacts with other rules in unexpected ways, you won't have any unintended consequences. For more information see [Test mail flow rules in Exchange Online](https://learn.microsoft.com/exchange/security-and-compliance/mail-flow-rules/test-mail-flow-rules?azure-portal=true).

12. We will now switch from PowerShell to the **Exchange Admin Center** to view the Rules user interface. 

    Close the PowerShell window and then select the **Microsoft Edge** icon on the taskbar. The **EAC** should open up to the **Message trace search results** page. 

    If you exited out of edge, in a new tab, enter **<https://admin.exchange.microsoft.com/>**.
    
    If prompted, Sign-in with the tenant email account provided (**admin@xxxxxZZZZZZ.onmicrosoft.com**, where xxxxxZZZZZZ is your unique tenant prefix provided by your lab hosting provider) and the tenant password provided (Found under the resources tab in the VM's instruction pane).

13. On the left-hand navigation pane in the **EAC** select **Mail flow** and then select **Rules**. 

14. On the **Rule** page that is displayed, Notice the same list of Rules are displayed in the UI that were also output within PowerShell. 

    Select **Rule 1**.

15. On the **Rule 1** details page that appears on the right, take a moment to review the details. They should match what we saw when reviewing the rule within PowerShell. 

16. To resolve our transport issue, we will now disable **Rule 1** by select the slider under **Enable or disable rule**. 

    The rule should now show as disabled. Select the **X** at the top righ-hand corner of the rule details page to exit.

    Back on the **Rules** page, **Rule 1** should now show a status of **Disabled**.

    You can now close the **Exchange admin center** tab in your Edge browser. You should still

17. Navigate back to the **Microsoft 365 Admin center** by click The **Home - Microsoft 365 admin center** tab that should still be open in your edge browser. 

18. Select the **App Launcher** icon at the top left hand corner of the web page and then select the **Outlook** icon under the **Apps** header.

19. Once you are back in **Outlook**, repeat steps 2-7 from task 1 to ensure mail flow is now resolved to **Contoso.com**

# Proceed to Lab 1 Exercise 2
