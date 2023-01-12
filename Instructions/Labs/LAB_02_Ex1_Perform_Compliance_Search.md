# Lab 2 - Exercise 1 – Perform a Compliance Search

**Lab 2 ex 1 intro**

### Task 1 - Create an eDiscovery (Standard) Case

In this task, you will create an eDiscovery (Standard) case that searches for confidential information being disseminated through email.

1. On **LON-CL1**, you must select **Ctrl+Alt+Delete** to log in. Log into **LON-CL1** as the local Adatum administrator account that was created by your lab hosting provider (**Administrator**) with the password **Pa55w.rd**.

1. You will start by logging into **Allan Deyoung**, a user in your tenant. Select the **Microsoft Edge** icon from your taskbar and enter the following URL in the address bar: **<https://outlook.office.com/mail/>**.

1. On the **Sign in** page, enter **AllanD@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider), and then enter the tenant email password provided by your lab hosting provider on the **Enter password** page (Located under the resources tab of your VM's instruction pane). Select **Sign in**.

1. On the **Stay signed in?** window, select the **Don’t show this again** check box and then select **Yes**.

5. You are now signed into **Alex Deyoung's** mailbox. You will begin by sending an email to **Alex Wilber**, another user in your tenant.

6. In the message pane that appears on the right-side of the screen, enter the following information:

    - To: enter **AlexW@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider)

    - Subject: enter **Confidential**

    - Message Body: Leave blank

7. Select **Send**.

1. We can now log out of **Allan Deyoung's** mailbox by selecting the **account manager** and the top right hand corner of the webpage and then select **Sign Out**.

1. Close
2. You will now access **Microsoft Purview** from **LON-CL1**. Select the **Microsoft Edge** icon from your taskbar and enter the following URL in the address bar: **<https://compliance.microsoft.com>**.

    If prompted, Sign-in with the tenant email account provided (**admin@xxxxxZZZZZZ.onmicrosoft.com**, where xxxxxZZZZZZ is your unique tenant prefix provided by your lab hosting provider) and the tenant password provided (Found under the resources tab in the VM's instruction pane).

3. In the **Microsoft Purview** compliance portal, select **eDiscovery** in the left-hand navigation pane, and then in the expanded group select **Standard**.

4. In the **eDiscovery (Standard)** pane, select the **+Create a case** button.

5. In the **New case** pane that appears, enter the following information:

   - Name: **AlexWilber-case01** 

   - Case description: enter **This case searches for emails to Alex Wilber that include confidential information**.

6. Select **Save.**

12. In the **eDiscovery (Standard)** window, in the list of cases, select **AlexWilber-case01.**

13. A new window will open in your browser that displays this case. On the menu bar at the top of the page, select the **Hold** tab.

14. In the **Hold** tab for this case, select the **+Create** button. This will initiate the **New Hold** wizard that walks you through the steps to create a new hold.  

    You will begin by placing a hold on Alex Wilber’s account that will retain
    any emails that contain **Sensitive, Confidential, Secret** anywhere in the
    email as well as in the Subject line.

15. In the **New Hold** window, in the **Name your hold** page, enter the following information:

    - Name: **AlexW-Hold** 

    - Description: leave blank

1. select **Next**.

16. In the **Choose locations** page, Make sure the toggle switch for **Exchange mailboxes** is turned **On** then to the right of the **Exchange Mailboxes** under the included column, select **Choose users, groups, or teams**.

17. In the **Exchange mailboxes** page, enter **Alex** in the **Search** field that appears. This will initiate a search of all users whose name starts with Alex.

18. Select the check box next to **Alex Wilber** and then select the **Done** button at the bottom of the window.

19. On the **Choose locations** page, select **Next**.

20. On the **Query** page, in the **Enter keywords** field, enter the following: **Sensitive, Confidential, Secret**

21. Select **+Add conditions**.

22. in the menu that appears, select **Subject** (not the Subject/Title).

23. On the **Query** page, in the **Subject** section, select the drop-down arrow in the first operator field and select **Contains any of**. In the **Type subject** field, enter the following: **Sensitive, Confidential, Secret**

24. Select **Next**.

25. On the **Review your settings** page, review the settings and if any need to be adjusted, select **Edit** next to the setting and make the necessary correction.
Once all settings are correct, select **Submit**. 

    **Note:** You have just placed a hold on Alex Wilber’s account that will retain any emails that contain **Sensitive, Confidential, Secret** anywhere
    in the email as well as in the Subject line.

27. Once prompted with **Succeeded** select **Done** to close out of the **New Hold** wizard.

28. In the **eDiscovery (Standard) &gt; AlexWilber-case01** page, select the **Searches** tab at the top of the page.  

    You will now create a new search that checks for emails sent to **Alex Wilber** within the past 2 months.

29. In the **Searches** tab, select the **+ New Search** button. This will initiate a **New search** wizard that walks you through the steps to create a new search.

30. In the **New search** window, enter the following information:

    - Name: **AlexW - Recipient search**

    - Description: Leave blank
    
1. Select **Next**.

31. In the **Locations** page, select the **Specific locations** option and then select the toggle switch that appears to the left of **Exchange mailboxes** to turn it **On.** Select **Next**.

33. Select **+Add conditions.**

34. In the menu that appears, select **Recipients**.

35. On the **Define your search conditions** page, in the **Recipients** section, select the drop-down arrow in the first operator field and select **Contains any of**. In the **Choose users** field, start typing **Alex** and select **Alex Wilber** from the list of Suggested users.

33. Select **+Add conditions.**

34. In the menu that appears, select **Received**.

35. On the **Define your search conditions** page, in the **Received** section, select the drop-down arrow in the first operator field and select **After**. In the **Date** field, choose a date 2 months prior to todays date. For example, if its January 1st then select November 1st.

36. Select **Next**, **Submit** and **Done**. This initiates the search. It may take several minutes for the Search to complete.

    **Note:** It may take up to a minute for the **New search created** page to appear after hitting **Submit**.

37. In the **eDiscovery (Standard) &gt; AlexWilber-case01** page, the **Searches** tab should already be Selected. select the new search that was just created and a new pane for **AlexW - Recipient Search** will be displayed.

38. In the **Confidential Search** pane, select **Review sample**.

    Because Nestor was not assigned the eDiscovery Manager role, he is unable to view the search results. Therefore, you will be prompted with an error stating: **You can't preview search results because you're note assigned the Preview role. If you're a member of the Organization Management role group, you can go to the Permissions page and add yourself as a member of the eDiscovery Manager role group. Otherwise, contact your admin.**

    Select **OK** and then select **Close** to exit out of the **Confidential search** pane.

39. Leave the Edge browser open and proceed to the next lab.
