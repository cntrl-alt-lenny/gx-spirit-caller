typedef struct {
    int f0;
    int f4;
    void *ctx;
    void *digest;
    void (*init)(void *);
    void (*update)(void *, void *, int);
    void (*final)(void *, void *);
} Desc;

void func_02099718(void *out, void *msg, int msglen, unsigned char *key, int keylen, Desc *desc) {
    unsigned char tmp[0x40];
    unsigned char ipad[0x40];
    unsigned char opad[0x40];
    int i;
    if (out == 0) return;
    if (msg == 0) return;
    if (msglen == 0) return;
    if (key == 0) return;
    if (keylen == 0) return;
    if (desc == 0) return;
    if (keylen > desc->f4) {
        desc->init(desc->ctx);
        desc->update(desc->ctx, key, keylen);
        desc->final(desc->ctx, tmp);
        keylen = desc->f0;
        key = tmp;
    }
    for (i = 0; i < keylen; i++) {
        ipad[i] = key[i] ^ 0x36;
    }
    for (; i < desc->f4; i++) {
        ipad[i] = 0x36;
    }
    desc->init(desc->ctx);
    desc->update(desc->ctx, ipad, desc->f4);
    desc->update(desc->ctx, msg, msglen);
    desc->final(desc->ctx, desc->digest);
    for (i = 0; i < keylen; i++) {
        opad[i] = key[i] ^ 0x5c;
    }
    for (; i < desc->f4; i++) {
        opad[i] = 0x5c;
    }
    desc->init(desc->ctx);
    desc->update(desc->ctx, opad, desc->f4);
    desc->update(desc->ctx, desc->digest, desc->f0);
    desc->final(desc->ctx, out);
}
