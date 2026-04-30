FROM archlinux:latest

RUN pacman -Syyu --noconfirm && \
    pacman -S --noconfirm python python-pip zstd p7zip gcc git && \
    pacman -Scc --noconfirm

WORKDIR /app
COPY . /app/

# 🔥 IMPORTANT FIX
RUN python -m ensurepip --upgrade
RUN python -m pip install --break-system-packages --no-cache-dir -U setuptools wheel
RUN python -m pip install --break-system-packages --no-cache-dir -r requirements.txt

CMD ["bash", "start.sh"]
