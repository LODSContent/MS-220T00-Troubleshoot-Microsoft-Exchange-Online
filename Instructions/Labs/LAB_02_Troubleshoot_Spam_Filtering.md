# Lab 2 - Troubleshoot Spam Filtering

## Lab scenario

In the labs for this course, you're taking on the role of Adatum Corporations Messaging Administrator. You've deployed Microsoft 365 in a virtualized lab environment, and you've been tasked with completing a pilot that tests various M365 & Exchange functionalities as they relate to Adatum's business requirements.

In this lab, you'll be implementing and configuring a spam filtering policy for your organization. The primary objective of this lab is to create a policy that contains the following settings:

- Empty messages: **On**
- Embedded tags in HTML: **On**
- JavaScript or VBScript in HTML: **On**
- SPF record hard fail: **On**
- Sender ID filtering hard fail: **On**

The goal of this lab is to create a policy that will effectively block spam and unwanted messages, while allowing legitimate messages to pass through. Once the policy has been created, you'll test its behavior to ensure that its working as expected. This will involve sending test messages through the policy and observing the results. If any issues are identified, you'll need to investigate and resolve them. By the end of this lab, you'll have a spam filtering policy in place that will help to protect your organization's email communication and ensure that your users receive only the messages that are important to them.

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

### Personal Email Account Setup

In this lab, you'll be partnering with another student to exchange emails with. However, If you don't have a partner, or are following the self-paced version of this course, you can exchange emails from a personal Microsoft Outlook email account (@outlook.com, @Hotmail.com, @live.com, etc.) with your tenant admin account, **admin@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the unique tenant prefix provided by your lab hosting provider).

If you don't have a Personal Microsoft Outlook email account, you can follow the steps below to configure one:

1. On **LON-CL1**, right-click the **Microsoft Edge** icon from your taskbar and select **New InPrivate Window**
2. To create a new account, navigate to the following URL: **<https://signup.live.com>**
3. On the **Create account** account window, type in a unique name followed by either **@Outlook.com** or **@Hotmail.com**( For example, **User1@Outlook.com**) and then select **Next**.
4. Once a unique email address has been accepted, you'll be prompted to **Create a password**. Enter a unique password that has at least 8 characters and contains at least two of the following: uppercase letters, lowercase letters, numbers, and symbols, and then select **Next**.
5. On the **What's your name?** window, enter your full name (or if you'd prefer, fictitious information), and then select **Next**.
6. On the **What's your birthdate?** window, choose your **Country/region** and enter a **Birthdate**, then select **Next**.
7. On the **Create account** window, select **Next** and solve the generated puzzle.
8. On the **Stay signed in?** page, select **Yes**.
9. In a new **Microsoft Edge** tab, navigate to the URL: **<https://outlook.live.com/mail/>**.
10. Confirm you're able to sign-in to your new email account. Make note of your sign-in details for future lab tasks.

## Instructions

### Task 1 - Create a Spam Filtering Policy

In this task, you'll use the default global admin to sign into Microsoft 365 Defender and modify the existing default Anti-spam inbound policy to reflect the new policy requirements.

1. On **LON-CL1**, select **Ctrl+Alt+Delete** to sign-in. Sign-into **LON-CL1** as the local administrator account that was created by your lab hosting provider (**Administrator**) with the password **Pa55w.rd**.

2. You'll now access **Microsoft 365 Defender** from LON-CL1. Select the **Microsoft Edge** icon from your taskbar and enter the following URL in the address bar: **<https://security.microsoft.com>**.

    If prompted, Sign-in with the tenant email account provided (**admin@xxxxxZZZZZZ.onmicrosoft.com**, where xxxxxZZZZZZ is your unique
    tenant prefix provided by your lab hosting provider) and the tenant password provided (Found under the resources tab in the VMs instruction pane).

3. In the navigation pane on the left, scroll down to **Email & collaboration** and select **Policies & Rules**.

4. On the **Policies & Rules** page, select **Threat policies**.

5. In the **Threat policies** window, under the **Policies** section, select **Anti-spam**.

6. The **Policies & rules** > **Threat policies** > **Anti-spam policies** window displays a list of default Anti-spam policies that control how messages are handled by Microsoft 365 anti-spam policies.

    In the list of anti-spam policies, select the **Anti-spam inbound policy (Default)**.

7. In the Anti-spam inbound policy (Default) pane that appears, take a moment and review the policy settings that are available in this filter. There are three sections of settings – **Bulk email threshold & spam properties**, **Actions**, and **Allowed and blocked senders and domains**.

8. Once you’ve finished reviewing these settings, scroll to the bottom of the **Bulk email threshold & spam properties** section and select the **Edit spam threshold and properties** link.

9. In the **Spam threshold and properties** pane that appears, the **Bulk email threshold** at the top of the pane is set to **7** by default. Drag the slider to the left on the slider bar and change this value to **5.**

10. Under the **Mark as spam** section, update the following settings:

    - Empty messages: **On**

    - Embedded tags in HTML: **On**

    - JavaScript or VBScript in HTML: **On**

    - SPF record hard fail: **On**

    - Sender ID filtering hard fail: **On**

    **Note:** These next two settings allow you to automatically tag messages as spam when they originate from countries/regions that are to be avoided or distrusted, and messages written in specific languages.

    - Contains specific languages: **On**  

        You should already know the languages that you want to filter. In the blank field that appears below the **Contains specific languages** field, enter the first letter of a language that you want to filter. This will display all languages that start with that letter (and any languages that contain that letter within the name of the language).

        Enter a letter and then select a language with the letter in it that you
        want to filter. Repeat this step for a couple of languages.

    - From these countries: **On**

      You should already know the countries that you want to filter. In the blank field that appears below the **From these countries** field, enter the first letter of a country that you want to filter. This will display all countries that start with that letter (and any countries that contain that letter within the name of the language).

      Enter a letter and then select a country with the letter in it that you want to filter. Repeat this step for a couple of countries.

11. Leave all other settings as default, and the select **Save**.

12. Select **Close** to close the **Anti-spam inbound policy (Default)** pane and proceed to the next task.

### Task 2 - Test Anti-Spam Behavior

In this task, you'll be partnering up with a fellow student to exchange emails with to test the modified policies behavior. It's crucial to always test any new or modified Anti-Spam policy as it will have a direct impact on the number of junk email that users may receive day to day.

**Note:**  If you don't have a partner, you can exchange emails from a personal Microsoft Outlook email (@Outlook.com, @Hotmail.com, @live.com, etc.). Instructions to create a personal account are in the **Lab setup** Steps above if needed.

1. You should still be logged into **LON-CL1** from the prior task with the **Anti-spam policies** tab open inside of **Microsoft Edge**; if necessary, log back into **LON-CL1** as the **Administrator** with a password of **Pa55w.rd**.

2. You'll now navigate to **Outlook on the Web**. On the **Anti-spam policies** page, select the **App Launcher** on the top left-hand corner of the screen and under the **Apps** header select the **Outlook** icon.

3. You should now be back into your **MOD Administrators** mailbox.

    In the upper left-hand corner, select **New mail**.

4. In the message pane that appears on the right-side of the screen, enter the following information:

    - To: type in your partners admin email address. this email address will be similar to your admin email address (**admin@xxxxxZZZZZZ.onmicrosoft.com**) but differ slightly.

    - Subject: leave blank

    - Message Body: Leave blank

5. Select **Send**.

    When prompted with the message **Missing subject**, select **Send**.

    **IMPORTANT:** if you don't have another student to partner with, repeat steps 2-5 while logged into your personal account. Then send the email to your MOD administrator account, **admin@xxxxxZZZZZZ.onmicrosoft.com** (where xxxxxZZZZZZ is the unique tenant prefix provided by your lab hosting provider). Rather than logging out of your current **Microsoft Edge** browser session, right-click the **Microsoft Edge** icon in the taskbar and select **New InPrivate Window**.

6. After about 10-30 seconds you should notice that an email appears in your **Junk Email** Folder. Select your **Junk Email** folder to view it.

7. The message in the **Junk Email** folder should be from your partners **MOD Administrator** account (or your personal Microsoft Outlook email account if you didn't have a student to partner up with). Select the message to open the message preview.

8. Take a moment to review the contents of the message and the Mail-Tip warning displayed below **(No subject)**.

    The following Mail-Tip should be displayed: **This message was identified as junk. We'll delete it after 30 days**.

9. Leave the **Mail - MOD Administrator - Outlook** Tab open in your **Microsoft Edge** browser and proceed to the next task.

### Task 3 - Review Message Headers to Identify Mail Flow Issues

In the prior task, you identified that our test email landed in your junk email folder. In this task, we'll review the message headers using the Message Header Analyzer and verify whether or not this behavior was caused by the Anti-spam policy we modified back in task 1.

1. You should still be logged into **LON-CL1** from the prior task with the **Mail - MOD Administrator - Outlook** tab open inside of **Microsoft Edge**; if necessary, log back into **LON-CL1** as the **Administrator** with a password of **Pa55w.rd**.

2. While still logged into **Outlook** as the **MOD Administrator** click back into the **Junk Email** folder if you've navigated away from it.

    The Email received from the prior task should still be the **Junk Email** Folder.

3. Right-Click anywhere on the message preview and then select **View**. On the menu that appears, select **View message details**.

4. In the **Message details** pop-up that appears, select all the text (Ctrl-A) from the message header and then copy it to your clipboard (Ctrl-C). Select **Close** once the contents have been fully copied.

    You can now close the **Mail - MOD Administrator - Outlook** tab in your **Microsoft Edge** browser.

5. We'll now be navigating to the **Message Header Analyzer** to review the message header copied in the previous step. In your **Microsoft Edge** browser, open a new tab and enter the following URL: **<https://mha.azurewebsites.net/pages/mha.html>**.

6. Under the heading **Insert the message header you would like to analyze** paste (Ctrl-V) the message header copied from earlier. One the header has been inserted, select **Analyze headers**.

7. Take a moment and review the all the fields that are populated. There are Four sections to review – **Summary**, **Forefront Antispam Report Header**, **Microsoft Antispam Header** and **Other headers**.

8. Once you've finished reviewing the message header yourself, find the **Forefront Antispam Report Header** and expand it.

    To the right of **Spam Confidence Level** select **9**. This should open up a new tab in **Microsoft Edge** labeled **Antispam Stamps**.

    This Article reviews the various anti spam stamps added to a message, but we want to focus on the **Spam Confidence Level** (SCL):

    0 indicates a low probability that the message is spam, while 9 indicates a high probability that the message is spam.

    As the message header indicates our message has an SCL of 9, we'll want to dig further to determine why it was stamped this way.

    Close out of the **Antispam stamps** tab in **Microsoft Edge** and navigate back to the **Message header analyzer** tab.

9. With the **Forefront Antispam Report Header** still expanded, select the **HSPM** link next to **Protection Policy Category** which will open a new tab in **Microsoft Edge** labeled **Anti-spam message headers in Microsoft 365**

    This is a great article to keep favorited to help decipher the various **Anti-spam** message headers. If we the find functionality (Ctrl-F) to find the term **HSPM** we can see that the category of protection policy applied to the message was **High confidence spam**.

    Take a few minutes to review the rest of the fields mentioned under **X-Forefront-Antispam-Report message header fields** to see if one might help us determine why this email was marked as spam and moved to the junk folder.

    Once you've finished reviewing all the fields, close out of the **Anti-spam Message headers in Microsoft 365** tab in **Microsoft Edge** and navigate back to the **Message header analyzer** tab.

10. In the previous step, if you determined that the **X-CustomSpam** header points to the root cause, that's correct! In task 1 of this lab, we modified the default anti-spam inbound policy to enable the following settings:

    - **Empty messages: On**

    - Embedded tags in HTML: **On**

    - JavaScript or VBScript in HTML: **On**

    - SPF record hard fail: **On**

    - Sender ID filtering hard fail: **On**

    Because the message you sent your partner (or yourself using a personal account) contained no subject or message body, it was considered an **Empty message** and therefore labeled as spam and moved to the Junk Email Folder.

11. To get ready for the next task, on the **Message header analyzer** Tab, scroll up to the top of the page and expand **Summary**. Copy (Ctrl-c) the **Message Id** without **<** or **>**.

    Once the **Message Id** had been copied you can exit out of the **Message Header Analyzer** tab in **Microsoft Edge** and proceed to the next task.

### Task 4 - Review a Message Trace Using PowerShell

In this task, you'll be running a message trace using PowerShell instead of using the Message trace functionality built into the Exchange Admin Center (EAC). The purpose of this task is to give you exposure to alternative methods of accomplishing day to day tasks an Exchange Administrator may need to perform.

1. You should still be logged into **LON-CL1** as the **Administrator** with a password of **Pa55w.rd**; however, if the Windows sign-in page appears, then sign-in now.

2. Minimize the **Microsoft Edge** browser window and open an elevated instance of **Windows PowerShell**. Select the magnifying glass (Search) icon on the taskbar at the bottom of the screen and type **powershell** in the Search box that appears. In the list of search results, right-click on **Windows PowerShell** (do NOT select Windows PowerShell ISE) and select **Run as administrator** in the drop-down menu.

3. Maximize your PowerShell window. In Windows PowerShell, at the command prompt, type the following command and press Enter:

     `Install-Module -Name ExchangeOnlineManagement`

4. You might be prompted "NuGet provider is required to continue", enter [Y] Yes [N] No [S] Suspend [?], enter **Y** to select **[Y] Yes**

5. At the command prompt, type the following command and press Enter:

     `Connect-ExchangeOnline`

6. A **Microsoft 365 Sign in** window will appear. Enter in the username for the **Mod Administrator** account provided by your learning provider (admin@M365xZZZZZZ.onmicrosoft.com) and then select **Next**.

7. In the **Enter password** window, enter the password for this admin account provided by your learning provider, and then select **Sign in**. It may take a moment to sign in before it returns a command prompt.

8. At the command prompt, type the following command and press Enter:

      `$MessageTrace = Get-MessageTrace -MessageId "Add message ID here copied in Task 3 step 11"`

9. At the command prompt, type the following command and press Enter:

      `$MessageTrace | FL`

    Notice the Message Trace output provides basic information like:

    - Message Trace ID

    - Received date / time

    - Sender Address

    - Recipient Address

    - Message Status

    This may be enough details for some to determine minor mail flow issues, however we can take it a step further using the **Get-MessageTraceDetail** Exchange Online Command-let (CMDLET).

10. We first need to define several variables to make writing out the full command a bit easier. At the command prompt, type the following command and press Enter:

      `$MessageTraceId = $MessageTrace.MessageTraceId`

11. At the command prompt, type the following command and press Enter:

      `$RecipientAddress = $MessageTrace.RecipientAddress`

12. Now we're ready to type out the full **Get-MessageTraceDetail** CMDLET. At the command prompt, type the following command and press Enter:

      `Get-MessageTraceDetail -MessageTraceId $MessageTraceId -RecipientAddress $RecipientAddress | FL`

13. Take a minute to review the entire output for the **Get-MessageTraceDetail** CMDLET.

    Notice that using this CMDLET shows all of the message event details rather than just the final message trace results.

    Running both the **Get-MessageTrace** and **Get-MessageTraceDetails** together is good practice when initially reviewing mail flow issues in your environment.

## End of lab 2
