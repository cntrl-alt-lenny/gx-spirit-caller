/* func_ov002_022535a4: binary-search card_id -> handler-table index; clear
 * the ctrl-state result field, then (if found) call the stride-8 handler
 * table's fn-ptr slot with the original (ctx, card_id, arg2); return the
 * ctrl-state result field the handler may have set. */
struct ctrl { char _a[0xc]; int f_c; };
extern struct ctrl data_ov002_022cdb98;
typedef struct { void (*handler)(int, int, int); int _pad; } HandlerEntry;
extern HandlerEntry data_ov002_022cac38[];
extern int func_ov002_02253550(unsigned short card_id);

int func_ov002_022535a4(int ctx, int card_id, int arg2) {
    int idx = func_ov002_02253550((unsigned short)card_id);
    data_ov002_022cdb98.f_c = 0;
    if (idx >= 0)
        data_ov002_022cac38[idx].handler(ctx, card_id, arg2);
    return data_ov002_022cdb98.f_c;
}
