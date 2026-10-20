typedef struct {
    int value;
} Word;

void func_ov002_021b91d0(Word *a, Word *b) {
    Word temp = *a;
    *a = *b;
    *b = temp;
}
