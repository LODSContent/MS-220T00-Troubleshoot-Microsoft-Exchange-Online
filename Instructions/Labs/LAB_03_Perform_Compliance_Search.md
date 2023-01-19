# Lab 3 – Perform a Compliance Search

## Lab scenario

Scenario here

## Lab Setup

**Note:** In this lab exercise, you'll partner with another student to exchange emails with. If you don't have a partner, you can exchange emails from a personal Microsoft Outlook email account (@outlook.com, @Hotmail.com, @live.com, etc.) with your tenant admin account, **admin@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the unique tenant prefix provided by your lab hosting provider)

## Instructions

### Task 1 - Create an eDiscovery (Standard) Case

In this task, you'll create an eDiscovery (Standard) case that searches for confidential information being disseminated through email.

1. On **LON-CL1**, select **Ctrl+Alt+Delete** to sign-in. Sign-into **LON-CL1** as the local administrator account that was created by your lab hosting provider (**Administrator**) with the password **Pa55w.rd**.

2. You'll start by logging into **Allan Deyoung**, a user in your tenant. Select the **Microsoft Edge** icon from your taskbar and enter the following URL in the address bar: **<https://outlook.office.com/mail/>**.

3. On the **Sign in** page, enter **AllanD@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider), and then enter the tenant email password provided by your lab hosting provider on the **Enter password** page (Located under the resources tab of your VM's instruction pane). Select **Sign in**.

4. On the **Stay signed in?** window, select the **Don’t show this again** check box and then select **No**.

5. you're now signed into **Alex Deyoung's** mailbox. You'll begin by sending an email to **Alex Wilber**, another user in your tenant.

6. In the message pane that appears on the right-side of the screen, enter the following information:

    - To: enter **AlexW@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider)

    - Subject: enter **Confidential**

    - Message Body: Leave blank

7. Select **Send**.

8. We can now log out of **Allan Deyoung's** mailbox by selecting the **account manager** (indicated by Allan's profile picture) and then select **Sign out**

9. Close out of the **sign out** tab in Edge.

10. You'll now access **Microsoft Purview** using the **MOD Administrator** account. Open a new tab in **Microsoft Edge** and enter the following URL in the address bar: **<https://compliance.microsoft.com>**.

11. On the **Sign in** page, select **Use another account**. Sign in with the tenant email account provided **admin@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is your unique tenant prefix provided by your lab hosting provider), and the tenant password provided (Found under the resources tab in the VM's instruction pane).

12. On the **Stay signed in?** window, select the **Don’t show this again** check box and then select **Yes**.

13. In the **Microsoft Purview** compliance portal, select **eDiscovery** in the left-hand navigation pane, and then in the expanded group select **Standard**.

14. In the **eDiscovery (Standard)** pane, select the **+Create a case** button.

15. In the **New case** pane that appears, enter the following information:

    - Name: **AlexWilber-case01**

    - Case description: enter **This case searches for emails to Alex Wilber that include confidential information**.

16. Select **Save.**

17. In the **eDiscovery (Standard)** window, in the list of cases, select **AlexWilber-case01.**

18. A new window will open in your browser that displays this case. On the menu bar at the top of the page, select the **Hold** tab.

19. In the **Hold** tab for this case, select the **+Create** button. This will initiate the **New Hold** wizard that walks you through the steps to create a new hold.  

    You'll begin by placing a hold on Alex Wilber’s account that will retain any emails that contain **Sensitive, Confidential, Secret** in the Subject line.

20. In the **New Hold** window, in the **Name your hold** page, enter the following information:

    - Name: **AlexW-Hold**

    - Description: leave blank

21. select **Next**.

22. In the **Choose locations** page, Make sure the toggle switch for **Exchange mailboxes** is turned **On** then to the right of the **Exchange Mailboxes** under the included column, select **Choose users, groups, or teams**.

23. In the **Exchange mailboxes** page, enter **Alex** in the **Search** field that appears and hit **enter**. This will initiate a search of all users whose name starts with Alex.

24. Select the check box next to **Alex Wilber** and then select the **Done** button at the bottom of the window.

25. On the **Choose locations** page, select **Next**.

26. On the **Query** page, select **+Add conditions**.

27. in the menu that appears, select **Subject** (not the Subject/Title).

28. On the **Query** page, in the **Subject** section, select the drop-down arrow in the first operator field and select **Contains any of**. In the **Type subject** field, enter the following: **Sensitive, Confidential, Secret**

    **Note:** Leave the field under **Keywords** Blank.

29. Select **Next**.

30. On the **Review your settings** page, review the settings and if any need to be adjusted, select **Edit** next to the setting and make the necessary correction.
Once all settings are correct, select **Submit**.

    **Note:** you've just placed a hold on Alex Wilber’s account that will retain any emails that contain **Sensitive, Confidential, Secret** anywhere
    in the email and in the Subject line.

31. Once prompted with **Succeeded** select **Done** to close out of the **New Hold** wizard.

32. In the **eDiscovery (Standard) &gt; AlexWilber-case01** page, select the **Searches** tab at the top of the page.  

    You'll now create a new search that checks for emails that contain **Sensitive, Confidential, Secret** in the Subject line

33. In the **Searches** tab, select the **+ New Search** button. This will initiate a **New search** wizard that walks you through the steps to create a new search.

34. In the **New search** window, enter the following information:

    - Name: **Confidential search**

    - Description: Leave blank

35. Select **Next**.

36. In the **Locations** page, select the **Specific locations** option and then select the toggle switch that appears to the left of **Exchange mailboxes** to turn it **On.** Select **Next**.

37. In the **Define your search conditions** page, select **+Add conditions**.

38. In the menu that appears, select **Subject** (not the Subject/Title).

39. On the **Define your search conditions** page, in the **Subject** section, select the drop-down arrow in the first operator field and select **Contains any of**. In the **Type subject** field, enter the following: **Sensitive, Confidential, Secret**.

40. Select **Next**, **Submit** and **Done**. This initiates the search. It may take several minutes for the Search to complete.

    **Note:** It may take up to a minute for the **New search created** page to appear after hitting **Submit**.

41. In the **eDiscovery (Standard) &gt; AlexWilber-case01** page, the **Searches** tab should already be Selected. select the new search that was created and a new pane for **Confidential search** will be displayed.

42. In the **Confidential Search** pane, select **Review sample**.

    Because the **MOD Administrator** account is not assigned the eDiscovery Manager or eDiscover Admin role group, you're unable to view the search results. This is because these eDiscover roles aren't assigned by default to the Organization Management role group, thereforee it’s not a part of the Global admin role. For more information, on what permissions you do have as part of the Organization Management role group, see [RBAC roles related to eDiscovery]( https://learn.microsoft.com/microsoft-365/compliance/ediscovery-assign-permissions?view=o365-worldwide#rbac-roles-related-to-ediscovery?azure-portal=true).

    Select **OK** and then select **Close** to exit out of the **Confidential search** pane.

### Task 2 - Review eDiscovery Permissions

1. You should still be logged into **LON-CL1** as the **Administrator** with a password of **Pa55w.rd**; however, if the Windows sign-in page appears, then sign-in now.

2. The **Microsoft Edge** browser should still have the **AlexWilber-Case01 - Microsoft Purview** tab open. We'll start by first signing out of the **MOD Administrator** account and logging into your organizations eDiscovery case administrators account, **Nestor Wilke**.

    At the top right-hand corner of the screen, select the **account manager** for **MOD Administrator** (indicated with the letter **MA** ) and then select **Sign out**.

3. Next we'll review permissions in the **Microsoft 365 Defender** portal. Close and re-open **Microsoft Edge**, then navigate to the following URL: **<https://security.microsoft.com>**.

4. On the **Sign in** page, select **Use another account**. Sign in with the email **NestorW@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is your unique tenant prefix provided by your lab hosting provider), and the tenant password provided (Found under the resources tab in the VM's instruction pane).

    If prompted, On the **Stay signed in?** window, select the **Don’t show this again** check box and then select **Yes**.

5. In the **Microsoft 365 Defender** Portal, select **Permissions** in the left-hand navigation pane.

6. On the **Permissions** page that appears, select **Roles** under **Email & collaboration roles**.

7. On the **Permissions > Permissions** page that appears, click into the search bar and enter: **eDiscovery**

8. Select the **Magnifying glass** icon (search).

9. Select the **eDiscovery Manager** role that appears in the search results.

10. On the **eDiscover Manager** pane that appears, scroll down to the bottom and select **Edit** next to **eDiscovery Administrator**.

11. On the **Editing Choose eDiscovery Administrator** window that appears, select the **Edit** link under Nestor Wilke.

12. On the **Choose eDiscovery Administrator** page, select **+Add**.

13. In the list of **Members** find and select **MOD Administrator** then select **Add**.

14. Back on the **Chose eDiscovery Administrator** pane, you should now see both **Nestor Wilke** and **MOD Administrator** listed as members. Select **Done**, **Save**, **Close**.

    you've now successfully added a second **eDiscovery Administrator** role group member.

15. Next we'll navigate back to **Microsoft Purview** compliance portal. Open a new **Microsoft Edge** tab and enter the following URL: **<https://compliance.microsoft.com>**.

16. In the **Microsoft Purview** compliance portal, select **eDiscovery** in the left-hand navigation pane, and then in the expanded group select **Standard**.

17. Select the **AlexWilber-Case01** that was created in task 1 using the **MOD Administrator** account.

18. In the **eDiscovery (Standard) &gt; AlexWilber-case01** page, select the **Searches** tab at the top of the page.  

    You'll now review the previous search case created that checks for emails that contain **Sensitive, Confidential, Secret** in the Subject line.

19. select **Confidential search**.

20. In the **Confidential Search** pane, select **Review sample**.

    **Note:** It may take up to a minute for results to populate on the **Confidential search samples** Page.

    Because Nestor already has the **eDiscover administrator** role group assignment, he is able to view eDiscovery cases created by other administrators in his organization and review the samples.

21. At the top right-hand corner of the screen, select the **account manager** for **Nestor Wilke** (indicated by Nestor's User profile picture ) and then select **Sign out**.

22. Close out of **Microsoft Edge**.

### Task 3 - Run a Content Search

Intro about targeted collections here and how we'll now be deleting the Confidential email sent earlier by Allan Deyoung

1. You should still be logged into **LON-CL1** as the **Administrator** with a password of **Pa55w.rd**; however, if the Windows sign-in page appears, then sign-in now.

2. Select the magnifying glass (Search) icon on the taskbar at the bottom of the screen and type **powershell** in the Search box that appears. In the list of search results, right-click on **Windows PowerShell** (do NOT select Windows PowerShell ISE) and select **Run as administrator** in the drop-down menu.

3. Maximize your PowerShell window. In Windows PowerShell, at the command prompt, type the following command and press Enter:

     `Install-Module -Name ExchangeOnlineManagement`

      **Note:** During the initial lab setup (script) ran at the beginning of this exercise, the Exchange Online Management Module was installed. However, to familiarize yourself with the install process, we're outlining the detailed steps to manually install it. You may receive a warning that this module is already installed - ignore this.

4. You might be prompted "NuGet provider is required to continue", enter [Y] Yes [N] No [S] Suspend [?], enter **Y** to select **[Y] Yes**

5. At the command prompt, type the following command and press Enter:

     `Connect-ExchangeOnline`

6. A **Microsoft 365 Sign in** window will appear. Enter in the username for the **Mod Administrator** account provided by your learning provider (admin@M365xZZZZZZ.onmicrosoft.com) and then select **Next**.

7. In the **Enter password** window, enter the password for this admin account provided by your learning provider, and then select **Sign in**. It may take a moment to sign in before it returns a command prompt.

8. At the command prompt, type the following command press Enter:

     `CD C:\Users\administrator\desktop\'Lab scripts'\lab2`

9. At the command prompt, type the following command press Enter:

    `.\GetFolderSearchParameters.ps1`

10. When prompted **Enter an email address or a URL for a SharePoint or OneDrive for business site** enter: **AlexW@M365xZZZZZZ.onmicrosoft.com**

11. A **Microsoft 365 Sign in** window will appear. Select the **Mod Administrator** account provided by your learning provider (admin@M365xZZZZZZ.onmicrosoft.com).

12. A list of Folder Paths & Folder Path iD's will be displayed. We want to copy the ID of Alex's inbox folder. Highlight the entire string starting with **folderid:xxxxxx...** and right-click to copy.

    Here is an example of what the full sting will like (the letters and numbers will differ, this is just an example):

    **folderid:47EFE4AD1A8641408C8CCB0EDA12ACCE00000000010C0000**

13. We'll now start a new compliance search. To do this, we must first connect to the Security & Compliance Powershell module. At the command prompt. type the following command press Enter:

    `Connect-IPPSSession -UserPrincipalName admin@M365xZZZZZZ.onmicrosoft.com`

14. Next, at the command prompt, type the following command press Enter:

    `$Search = New-ComplianceSearch -Name "Inbox Search AlexW" -ExchangeLocation All -ContentMatchQuery '"Past FolderId here"(c:c)(subject:Confidential)'`

    **IMPORTANT**: be sure to replace **"Paste FolderId here"** with the Folderid collected in the prior step. There should be no spaces between the FolderId and (C:C). For example:

    **folderid:29563324EDBAD64D94CED5C383FE47E000000000010C0000(c:c)(subject:Confidential)**

15. To start the compliance search, at the command prompt type the following command press Enter:

    `Start-ComplianceSearch -Identity $Search.Identity`

16. It Will take a few minutes for the compliance search to complete. To check it's status, at the command prompt type the following command press Enter:

    `Get-ComplianceSearch -Identity "Inbox Search AlexW"`

17. Once the status shows as **Completed**, type the following command press Enter:

    `Get-ComplianceSearch -Identity "Inbox Search AlexW" | FL`

    **Note:**: The search results display all users, but we only have an item count greater than 0 for Alex Wilber. This is because in the command ran above, we have exchangelocation -all. If we want to specific a single mailbox we can rerun the command and set the exchange location to the SMTP of Alex Wilber.

18. To remove the confidential items identified out of Alex's inbox we'll need to start a new compliance action. At the command prompt type the following command press Enter:

    `New-ComplianceSearchAction -SearchName "Inbox Search AlexW" -Purge -PurgeType HardDelete -Confirm:$false`

19. It Will take a few minutes for the compliance action to complete. To check it's status, at the command prompt type the following command press Enter:

    `Get-ComplianceSearchAction "Inbox search AlexW_Purge" | FL`

    Once the **Status** shows **Completed** you'll see next to **Results** a value = **Purge Type: HardDelete; Item count: 1...**.

20. Lastly, we'll verify that the email has been deleted from the Alex Wilbers inbox. In the **Windows Taskbar**, right-click **Microsoft Edge** and select **New -inPrivate window**.

21. Enter the following URL in the address bar: **<https://outlook.office.com/mail/>**.

22. On the **Sign in** page, enter **AlexW@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider), and then enter the tenant email password provided by your lab hosting provider on the **Enter password** page. Select **Sign in**.

23. On the **Stay signed in?** window, select the **Don’t show this again** check box and then select **No**.

24. you're now logged into **Outlook on the Web** against Alex Wilbers Mailbox. Take a few minutes to check Alex's **Inbox** & **Deleted items**.

    Notice the confidential email sent by **Allan Deyoung** is not visible in any of Alex's mailbox folders. This indicates that you've successfully purged the confidential item.

## End of lab 3
