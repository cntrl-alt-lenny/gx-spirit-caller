typedef struct OvTask_021ac64c {
    unsigned int flags;
    unsigned int unk04;
    unsigned int unk08;
    unsigned int unk0c;
    void (*callback)(struct OvTask_021ac64c *);
} OvTask_021ac64c;

void func_ov000_021ac64c(OvTask_021ac64c *t) {
    unsigned int bit = t->flags;

    bit = bit << 30;
    bit = bit >> 31;
    if (bit) {
        void (*callback)(OvTask_021ac64c *) = t->callback;
        if (callback != 0) {
            callback(t);
        }
    }
}
