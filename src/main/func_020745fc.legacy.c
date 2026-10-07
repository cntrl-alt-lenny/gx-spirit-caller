typedef struct { char pad[0x54]; int f54; unsigned short f58; unsigned char f5a; char pad5b; } Entry02077d08;
extern Entry02077d08 data_021a071c[4];
typedef struct node { char pad[0x68]; struct node *next; char pad6c[0x38]; unsigned char *fa4; } node_t;
typedef struct { char pad[8]; node_t *head; } list_t;
extern list_t data_021a63d0;
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
typedef struct { char _pad[0x64]; unsigned int flag; } ctx_020919d8_t;
extern void func_020919d8(ctx_020919d8_t *ctx);
void func_020745fc(int now)
{
    int i;
    Entry02077d08 *entry;
    node_t *node;
    int state = OS_DisableIrq();
    for (i = 0, entry = data_021a071c; i < 4; i++, entry++) {
        if (entry->f5a && now - *(int *)((char *)entry + 0x50) > 957) entry->f5a = 0;
    }
    OS_RestoreIrq(state);
    for (node = data_021a63d0.head; node != 0; node = node->next) {
        unsigned char *conn = node->fa4;
        if (conn && *(void **)conn && conn[9] && conn[8] == 4 &&
            (*(unsigned char **)(conn + 12))[0x455] < 8 &&
            now - *(int *)(conn + 16) > 239 && *(int *)(conn + 4) == 2) {
            conn[8] = 0;
            *(int *)(conn + 4) = 0;
            func_020919d8(*(void **)conn);
        }
    }
}
