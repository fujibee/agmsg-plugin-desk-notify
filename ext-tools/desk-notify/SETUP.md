# desk-notify first steps

desk-notify has no settings and no secrets, so it joins directly. The one
thing worth checking is that this machine shows the notifications, which can
only be seen once it is joined. Walk the user through this:

1. Join it (`desk` is a good member name):

   ```
   bash <skill-root>/scripts/join.sh <team> desk ext-tool --tool desk-notify
   ```

   `<skill-root>` is the agmsg install this file sits under (it is in
   `<skill-root>/plugins/sources/github/.../ext-tools/desk-notify/SETUP.md`).

2. Send it one message from the user's own member and ask the user whether a
   notification titled `agmsg: <sender> (<team>)` appeared:

   ```
   bash <skill-root>/scripts/send.sh <team> <you> desk "desk-notify test"
   ```

3. If nothing appeared:
   - On macOS the notification comes from Script Editor: allow notifications
     for Script Editor in System Settings > Notifications, then send again.
   - If the sender got a reply saying there is no desktop notifier, this
     machine has neither `osascript` (macOS) nor `notify-send` (Linux), and
     desk-notify cannot work here.
