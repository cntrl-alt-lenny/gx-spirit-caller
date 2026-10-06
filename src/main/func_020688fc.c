typedef struct {
    char *s[2];
} pair_020688fc_t;

extern pair_020688fc_t data_020bee74;
extern int func_020aaf40(void *a, void *b);

int func_020688fc(char *str) {
    pair_020688fc_t list = data_020bee74;
    unsigned int i;

    for (i = 0; i < 2; i++) {
        if (func_020aaf40(str, list.s[i]) == 0) {
            return 0;
        }
    }
    return 1;
}
