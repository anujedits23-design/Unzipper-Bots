FROM archlinux:latest

RUN pacman -Syyu --noconfirm
RUN pacman -S --noconfirm python python-pip zstd p7zip gcc git

# ❌ pip upgrade hata diya
# RUN pip3 install -U pip

RUN mkdir /app/
WORKDIR /app/

COPY . /app/

# safer install
RUN pip install --no-cache-dir -U setuptools wheel
RUN pip install --no-cache-dir -r requirements.txt

CMD ["bash", "start.sh"]
