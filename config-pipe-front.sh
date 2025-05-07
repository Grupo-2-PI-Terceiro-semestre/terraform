set -e
# Cria o diretório do runner e entra nele
mkdir -p actions-runner
cd actions-runner

# Baixa o pacote do runner
curl -o actions-runner-linux-x64-2.323.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.323.0/actions-runner-linux-x64-2.323.0.tar.gz

# Verifica o checksum do pacote baixado
echo "0dbc9bf5a58620fc52cb6cc0448abcca964a8d74b5f39773b7afcad9ab691e19  actions-runner-linux-x64-2.323.0.tar.gz" | shasum -a 256 -c

# Extrai o pacote
tar xzf actions-runner-linux-x64-2.323.0.tar.gz

# Configura o runner em modo não interativo
./config.sh --unattended --url https://github.com/Grupo-2-PI-Terceiro-semestre/front-end --token BB6QYUKYID2G44K2ICJAD33H7HE4G

echo "Esperando rede e tempo de setup..." >> /tmp/debug.log

echo "Iniciando runner..." >> /tmp/debug.log
nohup ./run.sh > runner.log 2>&1 &
echo "Runner iniciado!" >> /tmp/debug.log