FROM debian:11
ENV DEBIAN_FRONTEND noninteractive
RUN apt update
RUN apt install -qq -y curl
RUN curl -Lo /opt/winbox.exe https://download.mikrotik.com/winbox/3.37/winbox64.exe
RUN apt install -qq -y \
	ca-certificates \
	ncurses-base \
	util-linux \
	xauth \
	libegl1-mesa \
	xorg \
	xwayland \
	xterm \
	fonts-liberation \
	fonts-roboto \
	hicolor-icon-theme \
	libcanberra-gtk-module \
	libexif-dev \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libpangox-1.0-0 \
	libv4l-0 \
	fonts-symbola \
	wine \
	zenity
ENTRYPOINT wine /opt/winbox.exe

