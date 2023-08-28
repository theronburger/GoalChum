'use strict';
import Koa from 'koa';
import bodyParser from 'koa-bodyparser';
import serve from 'koa-static';

const host = process.env.HOST ?? 'localhost';
const port = process.env.PORT ? Number(process.env.PORT) : 3000;

const app = new Koa();
app.use(bodyParser());

try {
  process.stdout.write('🍯 Loading frontend. ');
  app.use(serve('public'));
  console.log('✅');
} catch (error) {
  console.log("Hmmm, that didn't work. Did you build it?");
}

app.use((ctx) => {
  ctx.body = `🚧 Hit fallback\n\n${JSON.stringify(ctx, null, 2)}`;
});

app.listen(port, () => {
  console.log(`🦻 Listening for HTTP requests on http://${host}:${port}`);
});
