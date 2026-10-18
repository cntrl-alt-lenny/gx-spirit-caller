typedef struct list_node_3 { struct list_node_3 *next; } list_node_3_t;
typedef struct { short slots[16]; int count; } Entry;
typedef struct { int a; int b; short c; short d; char pad[0x14]; Entry ent[16]; short tail[16]; } Table;
typedef struct Node { struct Node *next; int type; void *arg; int pad[3]; } Node;
extern void func_02095418(void);
extern int func_02095678(int x);
extern void func_02095838(list_node_3_t *arg);
extern int func_02095880(int a);
extern void func_02095c48(Table *t);
extern Node data_021a6a20[];
extern Node *data_021a674c;
extern int data_021a6750, data_021a6754, data_021a6758, data_021a6760, data_021a6764, data_021a6768, data_021a676c;
extern void *data_021a675c;
extern unsigned char data_021a7a20[];
extern unsigned char data_021a8208[];
extern Table data_021a67a0;
extern Table *data_021a8280;
void func_02095a50(void) {
    int i;
    Node *p;
    func_02095418();
    data_021a674c = data_021a6a20;
    p = data_021a6a20;
    for (i = 0; i < 255; i++) {
        p->next = &data_021a6a20[i + 1];
        p++;
    }
    *(int *)(data_021a7a20 + 0x7e8) = 0;
    data_021a675c = data_021a8208;
    data_021a6754 = 0;
    data_021a6758 = 0;
    data_021a6768 = 0;
    data_021a6760 = 0;
    data_021a6764 = 0;
    data_021a676c = 1;
    data_021a6750 = 0;
    data_021a8280 = &data_021a67a0;
    func_02095c48(&data_021a67a0);
    p = (Node *)func_02095880(1);
    if (p == 0) return;
    p->type = 0x1d;
    p->arg = data_021a8280;
    func_02095838((list_node_3_t *)p);
    func_02095678(1);
}




