typedef struct {
    unsigned int a, b, c;
    unsigned short first[80];
    unsigned short second[15];
    unsigned short third[31];
} Record;
/* The original omits the unused input of this pass-through thunk. */
extern void func_0200974c();
/* The original passes a card ID; the current C definition omits this input. */
extern unsigned char func_0202b9ec();
extern int func_020b3870(int numerator, int denominator);

int func_020121b4(Record *p) {
    unsigned int middle = p->b;
    unsigned int total = p->a + p->c;
    unsigned int left = middle + total;
    unsigned int i, j;
    int card, limit, count;
    int card2;
    unsigned int k;
    int card3;
    unsigned int l;
    func_0200974c();
    for (i = 0; i < p->a; i++) {
        card = p->first[i];
        if (card != 0) {
            limit = func_0202b9ec(card);
            count = 1;
            if (limit < 1) {
                p->first[i] = 0;
                left--;
            }
            for (j = i + 1; j < p->a; j++) {
                if (card == p->first[j]) {
                    count++;
                    if (count > limit) {
                        p->first[j] = 0;
                        left--;
                    }
                }
            }
            for (j = 0; j < p->b; j++) {
                if (card == p->second[j]) {
                    count++;
                    if (count > limit) {
                        p->second[j] = 0;
                        left--;
                    }
                }
            }
        }
    }
    for (k = 0; k < p->b; k++) {
        card2 = p->second[k];
        if (card2 != 0) {
            limit = func_0202b9ec(card2);
            count = 1;
            if (limit < 1) {
                p->second[k] = 0;
                left--;
            }
            for (j = k + 1; j < p->b; j++) {
                if (card2 == p->second[j]) {
                    count++;
                    if (count > limit) {
                        p->second[j] = 0;
                        left--;
                    }
                }
            }
        }
    }
    for (l = 0; l < p->c; l++) {
        card3 = p->third[l];
        if (card3 != 0) {
            limit = func_0202b9ec(card3);
            count = 1;
            if (limit < 1) {
                p->third[l] = 0;
                left--;
            }
            for (j = l + 1; j < p->c; j++) {
                if (card3 == p->third[j]) {
                    count++;
                    if (count > limit) {
                        p->third[j] = 0;
                        left--;
                    }
                }
            }
        }
    }
    if (left != 0) {
        if (func_020b3870(left * 100, middle + total) == 0) return 1;
    }
    return func_020b3870(left * 100, middle + total);
}











