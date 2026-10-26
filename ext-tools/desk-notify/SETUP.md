# desk-notify setup

Read this when `join <team> <name> ext-tool --tool desk-notify` stops because
no member config exists yet. desk-notify has no settings and no secrets, so
there is nothing to ask the user beyond the member name.

`<skill-root>` is the agmsg install this file sits under (it is in
`<skill-root>/plugins/sources/github/.../ext-tools/desk-notify/SETUP.md`);
`ext-tool.sh` and `join.sh` are in `<skill-root>/scripts/`.

1. Check that this machine can show notifications:

   ```
   bash <skill-root>/scripts/ext-tool.sh setup <team> <name> desk-notify check notifier
   ```

   `{"ok":true,"notifier":"osascript"}` (macOS) or `"notify-send"` (Linux)
   means it can. Otherwise it says why; desk-notify cannot work on this
   machine, so stop here and tell the user.

2. Save the member config:

   ```
   bash <skill-root>/scripts/ext-tool.sh setup <team> <name> desk-notify save
   ```

3. Show a test notification and ask the user whether it appeared:

   ```
   bash <skill-root>/scripts/ext-tool.sh setup <team> <name> desk-notify test
   ```

   On macOS, if nothing appeared, the user may need to allow notifications
   for Script Editor in System Settings > Notifications.

4. Join:

   ```
   bash <skill-root>/scripts/join.sh <team> <name> ext-tool --tool desk-notify
   ```
