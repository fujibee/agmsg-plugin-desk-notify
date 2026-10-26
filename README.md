# agmsg-plugin-desk-notify

An [agmsg](https://github.com/fujibee/agmsg) plugin with one ext-tool,
`desk-notify`. An ext-tool is a program that joins a team as a member; sending
it a message runs it. A desk-notify member stands for a person's desk: every
message sent to it shows up as a desktop notification on that machine.

It needs agmsg 1.7.0 or newer, `git`, `jq`, and a desktop notifier: `osascript`
on macOS (built in) or `notify-send` on Linux.

## Install

```
agmsg plugin install fujibee/agmsg-plugin-desk-notify
```

agmsg shows the source, the commit, the driver it adds (`ext-tools/desk-notify`)
and the files that can run, then asks `y/N`. Answer `y`.

```
agmsg plugin list
```

`ext-tools/desk-notify` is listed as `trusted`, with this repository and the
commit next to it.

## Use

`<team>` is one of your teams, `<you>` is your own member name, and `<skill>`
is your agmsg install, normally `~/.agents/skills/agmsg`.

```
bash <skill>/scripts/join.sh <team> desk ext-tool --tool desk-notify
bash <skill>/scripts/send.sh <team> <you> desk "build finished, ready for review"
```

desk-notify has no settings, so it joins directly.

A notification titled `agmsg: <you> (<team>)` appears with the start of the
message (about 120 characters, on one line). No reply is sent; the full text
stays in the team's history. If the notification cannot be shown, the sender
gets one reply saying why.

On macOS the notification is shown through Script Editor; if nothing appears,
allow notifications for Script Editor in System Settings > Notifications.

## Remove

```
bash <skill>/scripts/leave.sh <team> desk
agmsg plugin remove fujibee/agmsg-plugin-desk-notify
```

The member config under `<skill>/ext-tools/<team>/` stays until you delete it.

## Layout

```
agmsg-plugin.conf          # name, description, min_core
ext-tools/desk-notify/
├── tool.conf              # manifest (read as data, never run)
├── handle                 # runs once per message; shows the notification
├── SETUP.md               # first steps, for an agent setting it up
└── USAGE.md               # what a sender should expect
```

There is no `setup`: a tool without one has no settings, and agmsg joins it
directly. tool.conf and handle are all an ext-tool needs.

The ext-tool contract (`handle`'s stdin JSON, exit codes, timeouts) and how
plugins are installed and trusted are in agmsg's
[docs/plugins.md](https://github.com/fujibee/agmsg/blob/main/docs/plugins.md).

## License

MIT
