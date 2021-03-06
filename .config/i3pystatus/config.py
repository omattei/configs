# Configuration files for yemen machine
# Andrea Shaw <rshaw@olivermattei.net>

from i3pystatus import Status
from i3pystatus.weather import weathercom

status = Status()

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
    format="%a %-d %b %Y %k:%M:%S KW%V",)

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
status.register("load",
    on_leftclick="urxvt -name mongolia -e htop")

# Show's CPU usage
#status.register("cpu_usage_bar",)
status.register("cpu_usage_graph",)
status.register("cpu_usage",
    format="CPU: {usage}%",)

#status.register("net_speed")
#status.register(
#    'weather',
#    format='Temp: {current_temp} (Hi: {max_temp} Lo: {min_temp}) Hum: {humidity}%',
#    colorize=True,
#    location_code='22904:4:US',
#)

status.register(
    'weather',
    format='Current Temp: {current_temp}{temp_unit}[ (Hi: {high_temp}[{temp_unit}]] Lo: {low_temp}{temp_unit} Hum: {humidity}%',
    colorize=True,
    backend=weathercom.Weathercom(
	location_code='22904:4:US',
        units='metric',
    ),
)


# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
    format="CPU: {temp:.0f}°C",)
# Show GPU temp
#status.register("gpu_temp")
# The battery monitor has many formatting options, see README for details

# This would look like this, when discharging (or charging)
# ↓14.22W 56.15% [77.81%] 2h:41m
# And like this if full:
# =14.22W 100.0% [91.21%]
#
# This would also display a desktop notification (via D-Bus) if the percentage
# goes below 5 percent while discharging. The block will also color RED.
# If you don't have a desktop notification demon yet, take a look at dunst:
#   http://www.knopwob.org/dunst/
status.register("battery",
    format="{status}/{consumption:.2f}W {percentage:.2f}% {remaining:%E%hh:%Mm}",
    alert=True,
    alert_percentage=5,
    status={
        "DIS": "↓",
        "CHR": "↑",
        "FULL": "=",
    },)

# This would look like this:
# Discharging 6h:51m
#status.register("battery",
#    format="{status}",
#    alert=True,
#    alert_percentage=5,
#    status={
#        "DIS":  "Discharging",
#        "CHR":  "Charging",
#        "FULL": "Bat full",
#    },)

# Displays whether a DHCP client is running
#status.register("runwatch",
#    name="DHCP",
#    path="/var/run/dhclient*.pid",)

# Shows the address and up/down state of eth0. If it is up the address is shown in
# green (the default value of color_up) and the CIDR-address is shown
# (i.e. 10.10.10.42/24).
# If it's down just the interface name (eth0) will be displayed in red
# (defaults of format_down and color_down)
#
# Note: the network module requires PyPI package netifaces
#status.register("network",
#    interface="eth0",
#    format_up="{v4cidr}",)

# Note: requires both netifaces and basiciw (for essid and quality)
status.register("network",
    interface="wlp2s0",
    format_up="{essid}{quality:3.0f}% @{v4cidr}",)

# Shows disk usage of /
# Format:
# 42/128G [86G]
#status.register("disk",
#    path="/",
#    format="{used}/{total}G [{avail}G]",)

# Shows backlight brightness
status.register("backlight",
    interval=1,
    format="BL: {percentage}%",
    base_path="/sys/class/backlight/intel_backlight/")

# Shows pulseaudio default sink volume
#
# Note: requires libpulseaudio from PyPI
status.register("pulseaudio",
    format="♪: {volume}",)

# Shows spotify status
status.register("spotify",
    format="{artist} —→ {title} ({length})",)

# Shows pianobar status
#status.register("pianobar",
#    format="{songartist} —→ {songtitle}",
#    songfile="/home/polychoron/.config/pianobar/song",
#    ctlfile="/home/polychoron/.config/pianobar/ctl")

status.run()

