

# Usa imagem com Node
FROM node:20-alpine

# Cria diretório de trabalho
WORKDIR /aplicativo

# Copia os arquivos de dependência
COPY package*.json ./

# Instala o TypeScript globalmente
RUN npm install -g typescript

# Instala dependências
RUN npm install

# Copia o resto do projeto
COPY . .

# Compila o TypeScript
RUN npm run build

# Expõe a porta (ex: 5000)
EXPOSE 5000

# Comando para rodar a aplicação
CMD ["npx", "ts-node-dev", "--respawn", "--transpile-only", "src/index.ts"]
