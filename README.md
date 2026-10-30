# AIMTRAK

Treinador de mira 3D para navegador, focado em prática de VALORANT. Inclui Jett,
Vandal, animações de primeira pessoa, onze cenários, rotina de aquecimento,
histórico local e uma versão portátil em um único HTML.

[**Jogar na versão hospedada**](https://aimtrak-range.nikolasetatiana.chatgpt.site/)
· [Baixar o HTML portátil](https://github.com/frogliz/aimtrak/raw/refs/heads/main/AIMTRAK.html)
· [Documentação técnica](docs/TECHNICAL.md)
· [Publicação e desenvolvimento](docs/DEVELOPMENT.md)

A versão hospedada atual pede login do ChatGPT e respeita os acessos já concedidos.
O HTML portátil funciona sem login. GitHub Pages está preparado pelo workflow do
repositório; veja a configuração abaixo antes de divulgar um endereço de Pages.

## Jogar agora

Baixe `AIMTRAK.html` e abra o arquivo no Chrome, Edge ou Firefox em um computador.
Os modelos, as animações, as fontes e os sons já estão incluídos. Clique para
iniciar o treino e liberar o áudio e a captura do mouse.

Para desenvolver ou servir a versão modular, use Node.js 22 ou mais recente:

```sh
git clone https://github.com/frogliz/aimtrak.git
cd aimtrak
npm ci
npm run dev
```

Abra **http://localhost:4173**. No Windows, `iniciar.bat` também inicia o servidor
depois de instalar o Node.js. O jogo modular precisa de HTTP/HTTPS; para abrir por
duplo clique, use o arquivo portátil.

## O que já está pronto

- Jett como adversária, mãos de primeira pessoa e Vandal com animações de equipar,
  atirar, recarregar, inspecionar e andar.
- Sensibilidade padrão **0,175 / 1600 DPI**, eDPI 280, relatório de cm/360° e
  calibração manual. Mira de pontinho de **3 pixels** por padrão.
- Onze cenários: microajustes, flicks, strafe e parada, limpeza de ângulos,
  tracking, longa distância, reação e one-tap, Desafio 30, rajadas de três tiros,
  transferência de spray e range livre.
- Desafio 30 termina na 30ª eliminação; rajadas têm pausa de recuperação de
  350 ms; transferência mede o intervalo entre os dois alvos.
- Cinco sons de kill fornecidos para o projeto. Depois do ace, as próximas kills
  repetem o ace; cinco segundos sem kill reiniciam a sequência. O som anterior
  continua mais baixo quando entra outro.
- Rotinas, resultados, histórico das últimas 100 sessões e exportação JSON,
  guardados neste navegador.

## Controles

| Ação | Tecla / mouse |
| --- | --- |
| Mover | W A S D |
| Andar / agachar / pular | Shift / Ctrl ou C / Espaço |
| Atirar / ADS | Botão esquerdo / botão direito |
| Equipar / recarregar / inspecionar | 1 / R / V |
| Pausar | Esc |

O modo de compatibilidade usa arrastar com o botão direito para olhar e Z para
ADS. Prefira WebGL 2 e captura normal do mouse para treinar; o renderizador CPU é
um recurso de compatibilidade e não oferece o mesmo desempenho.

## Comandos

| Comando | Resultado |
| --- | --- |
| `npm run dev` ou `npm start` | Servidor local em `http://localhost:4173` |
| `npm run check` | Verifica a sintaxe dos módulos e os arquivos essenciais |
| `npm test` | Executa os testes de sensibilidade, treino, áudio e animações |
| `npm run build:portable` | Atualiza `AIMTRAK.html` com todos os recursos embutidos |
| `npm run build` | Gera o portátil e a pasta `build/` pronta para hospedagem |

## Publicar pelo GitHub Pages

1. Abra **Settings → Pages** neste repositório.
2. Em **Build and deployment → Source**, selecione **GitHub Actions**.
3. Abra **Actions → Publicar GitHub Pages → Run workflow**, escolhendo `main`.

O workflow testa o projeto, gera a distribuição e publica a pasta `build/`. Novos
pushes para `main` repetem a publicação. O endereço confirmado aparece no ambiente
`github-pages` e no resumo da execução. Nenhum token pessoal precisa ser salvo no
código: o workflow usa o token temporário do próprio GitHub.

## Estrutura

| Caminho | Conteúdo |
| --- | --- |
| `dist/` | Código do jogo, modelos, áudio, fontes e bibliotecas locais |
| `AIMTRAK.html` | Distribuição portátil pronta para abrir |
| `scripts/` | Servidor, verificação, empacotamento e preparação de modelos |
| `tests/` | Testes automatizados e página de revisão dos modelos |
| `docs/` | Notas técnicas, desenvolvimento e pesquisa da Gaia |
| `.github/workflows/` | Verificação automática e publicação no Pages |

## Estado da Gaia e limites atuais

A Vandal visual atual é a base. **A skin Gaia 3D ainda não está instalada**: o
[modelo encontrado](https://sketchfab.com/3d-models/gaia-vandal-red-dfeddd540e7641bfb0b7128155117a1d)
exigiu autenticação para download. Os sons Gaia fornecidos já estão incluídos.
O registro da pesquisa está em [docs/gaia-research.json](docs/gaia-research.json).

Este é um projeto independente, sem vínculo com a Riot Games. Recoil, dispersão,
movimentação e ADS são aproximações para treino; não são uma reprodução validada
do cliente oficial. O navegador não detecta nem altera o DPI físico. O código da
sensibilidade e a ferramenta de calibração estão descritos na documentação técnica.

## Créditos

Modelos, texturas, personagens e áudio de VALORANT pertencem aos respectivos
titulares. Os arquivos fornecidos mantêm suas atribuições em
[dist/licenses/](dist/licenses/); a disponibilidade pública de um modelo não cria
uma licença aberta para ele. Three.js, Lucide e fontes Ubuntu têm seus avisos
incluídos. Este repositório não concede uma nova licença sobre esses recursos.
