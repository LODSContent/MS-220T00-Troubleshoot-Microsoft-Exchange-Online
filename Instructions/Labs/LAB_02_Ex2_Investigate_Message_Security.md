# Lab 2 - Exercise 2 – Investigate Message Security

**Lab 2 ex 2 intro**

### Task 1 - Create a Sensitivity Label

To utilize time more effectively, we are first going to create a new sensitivity label so that it has enough time to replicated by the time we reach task 4.

**Note:** In this lab exercise, you will partner with another student to exchange emails with. If you do not have a partner, you can exchange emails from a personal email account (@outlook.com, @Hotmail.com, @live.com, etc) with your tenant admin account, **admin@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the unique tenant prefix provided by your lab hosting provider)

1. On **LON-CL1**, select **Ctrl+Alt+Delete** to log in. Log into **LON-CL1** as the local administrator account that was created by your lab hosting provider (**Administrator**) with the password **Pa55w.rd**.

2. You will begin by accessing the **Microsoft Purview** compliance portal on **LON-CL1**. Select the **Microsoft Edge** icon from your taskbar and enter the following URL in the address bar: **<https://compliance.microsoft.com/mail/>**.

3. On the **Sign in** page, enter **admin@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the tenant prefix provided by your lab hosting provider), and then enter the tenant email password provided by your lab hosting provider on the **Enter password** page. Select **Sign in**.

4. On the **Stay signed in?** window, select the **Don’t show this again** check box and then select **Yes**.

5. In the **Microsoft Purview** compliance portal, on the left-hand navigation pane, select **Information Protection**.

6. On the **Information protection** page that is displayed, select the **Lables** tab from the menue.

7. On the **Lables** page, select **+ Create a label**.

8. A **New Sensitivity Label** page should be displayed. Under **Name and create a tooltop for your label** enter the following information:

    - Name: enter **Highly Confidential - Project Falcon**

    - Display Name: enter **Highly Confidential - Project Falcon**

    - Description for users: enter **Confidetial - Data is classified and protected**

    - Description for admins: leave blank

    Select **Next**.

9. On the **Define the scope for this label** page, leave the default settings enabled and select **Next**.

10. On the **Choose proection settings for labeled items** page, enable **Apply or remove encryption** and then select **Next**.

11. On the **Encryption** Page, with **Configure encryption settings** enabled, select the following options:

    - Assign permissions now or let users decide? - select **Assign permissions now**

    - User access to content expires? - select **A number of days after label is applied**

    - Access expires this many days after the label is applied - enter **30**

    - Allow offline access - select **Never**

12. While still on the **Encryption page**, Under the **Assign permissions to a specific user or groups** select the **Assign permissions** link. A new window displaying **Assign permissions** Should now be displayed on the right-hand side of the screen. Configure the following options:

    - Select **+ Add users or groups**. From the list of users that is displayed, select **MOD Administrator** & **Allan Deyoung** and then select **Add**.

    - Select **+ Add users or groups** and new text box should appear. Enter your partners admin accounts email (Your partners admin email tenant prefix should look similar to yours **@xxxxxZZZZZZ.onmicrosoft.com**) then select **Add**.

    **IMPORTANT:** In a later task we will be sending this email account an encrypted message. Please ensure you use a valid email address. If you do not have a partner, instead use a personal email address that you can recieve email with (@Outlook.com, @live.com, @hotmail.com, etc)

    When finished, select **Save** and then select **Next**.

13. On the **Auto-labeling for filed and emails**, leave the default setting (disabled) and select **Next**. 

14. On the **Define protection settings for groups and sites** page, leave the options disabled (Unchecked) and select **Next**.

15. On the **Auto-labeling for schematized data assetss (preview)** page, leave the default setting (disabled) and select **Next**.

16. On the **Review your settings and finish** page, review all the configured settings. If needed, you can modify the settings by clicking the **Edit** link uder the setting name. When finished reviewing the settings, select **Create label**.

    When prompted **Your sensitivity label was created**, select **Don't create a policy yet** and then select **Done**.

17. You should now be back on the **Information protection** page with the **Labels** tab selected. To assign the label we just created to a policy, select the **Label policies** tab from the menu. 

18. Under the **Label policies** tab, select **Global sensitivity label policy**.

19. On the new **Global sensitivity label policy** page that appears on the right-hand side of the window, select **Edit policy**.

20. A **Choose sensitivy labels to publish** page should be displayed. Under **Sensitivity labels to publish**, select the **Edit** link.

21. on the **Sensitivity labels to publish** page that appears, scroll down to the bottum and enable (Check) **Project Falcon** and then select **Add**.

22. Select **Next** on all proceeding pages until you reach **Review and finish** and then select **Submit**. 

    **Note:** If you recieve a **Client Error** warning stating **AddExchangeLocation and RemoveExchangeLocation parameters have same Location(s)**, select **OK** and follow the below steps. 
        
    - On the **Review and finish** under **Publish to users and groups*, select **Edit**. 

    - On the **Publish to users and groups** page, select the **Choose user or group** link.

    - Hover to the left of the **Name** heading and a check-box should appear. Select this check-box to select all users and then select **Done**

    - select **Next** on all proceeding pages until you reach **Review and finish** and then select **Submit**.

23. Once you see **Policy updated**, select **Done**.

24. Leave the **Information protection - Microsoft Purview** tab open in Edge and proceed to the next task.

### Task 2 - Configure a Mail Flow Rule to Apply Office Message Encryption 

We have been tasked to test the behavior of implementing a new Mail flow rule to encrypt emails when "Top secret" is in the subject field.

1. You should still be logged into **LON-CL1** as the **Administrator** with a password of **Pa55w.rd**; however, if the Windows log-in page appears, then log in now.

2. The **Microsoft Edge** browser should still have the **Information protection - Microsoft Purview** tab open in **Microsoft Edge**. We will now navigate to the **Exchange Admin Center** by opening a new tab in Edge and navigating to the following URL: **<https://admin.exchange.microsoft.com/>**.

3. In the **Exchange Admin Center** (EAC), in the left-hand navigation pane select **Mail flow**. In the expanded menu that appears, select **Rules**.

4. On the **Rules** page, Select the **+ Add a rule** icon in the menu bar and in the drop-down menu that appears, select **Apply Office 365 Message Encryption and rights protection to messages**.

5. In the **New Transport rule** wizard that appears, under **Set rule conditions** enter **Secure Message** in the **Name** field.

7. In the **Apply this rule if** drop down menu, select **The subject or body**.

     A new drop down menu will be displayed on the right. From this drop down, select **Subject or body includes any of these words.**

8. In the **specify words or phrases** window that appears, enter **Secure Message** in the text field and then select **Add**.

9. The word **Secure Message** should be displayed below the text field. Once completed, select **Save**.

10. This brings you back to the **Set rule conditions** page. Under **Do the following**, next to **Rights protect message with** select the **Select one** link. 

11. In the **Select RMS template** window that appears, select **Highly Confidential \ All Employees** From the drop down menu and then select **Save**.

12. Back on the **Set rule conditions** page, leave the **Except if** condition as the default setting, and then select **Next.**

13. In the **Set rule settings** window that appears, ensure **Rule mode** is set to **enforce**.

    Leave all other settings as default and then select **Next**.

14. In the **Review and finish** page, Verify the rule conditions and settings are correct. If corrections are needed, select **Edit rule conditions** or **Edit rule settings** and make the necessary corrections. Once you have verified the conditions and rules are correct, select **Finish**.

    It may take up to a minute to create the rule. Once **Transport rule created successfully** is displayed, select **Done**.

15. You will now be brought back to the **Rules** page. Notice the rule **Sensitive material** shows a status of **Disabled**.

    Select the word **Disabled** which will open up a new window for the **Sensitive material** rule settings. Under **Enable or disable rule** select the slider button so that it shows **Enabled** and then close the window by selecting **X** in the upper right hand corner.

    **Note:** After enabling the rule, it may take up to a minute for the rule to refresh and display as enabled.

16. Leave the **Exchange Admin Center** open to the **rules** tab on the **mail flow** page and proceed to the next task.

### Task 3 - Test Office Message Encryption Behavior

In the previous task we created a new Mail flow rule to mark emails with **Secure Message** in the Subject as Highly Confidential. This RMS policy applies Office Message Encryption (OME) with only users in your organization to view the message contents. To determine what types of errors users may encounter when troubleshooting OME issues, we will review what happens when a user does not have permissions to view an email that does not have access to view it in the following task. 

1. 