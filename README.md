# Copilot for Windows 11 - Enabling Tutorial
## Hey, nice to see you!
Probably you are here because you have tried different approaches in order to activate windows copilot, but failed. Right?
Okay, so here's what I found. For some regions, like the EU, it hasn't still rolled out for everyone, but yet I found a solution to get it activated.
## Here's a few things you can try:
1. Always be up to date.
2. Head to settings -> Windows Update -> Windows Insider Program, there:
 - If you are already in the insider program, make sure you are on the "Release Preview"
 - If you are NOT in the insider program, join it and select "Release Preview" (Initially set for Dev Channel)
3. Go to Time & Language and set your Region to the United States.
4. Finally, you need to modify the registry in order to bypass the checks.
 - You can either go yourself to  `"Computer\HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Copilot\BingChat"` and set `IsEligible` value to 1, or run the `_enable.copilot.bat` script I provided.

5. Lastly, go to Settins -> Personalization -> Taskbar and you should see it. Let me know if it doesn't.


# Notes
For some reasons, I noticed that after rebooting the system, the `IsEligible` is set back to 0, causing the Copilot to disable. To do this you can make the script run on startup.

# Thanks!
If I helped you, don't forget to star this repo, for others to see it as well.
