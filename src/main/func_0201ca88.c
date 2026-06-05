/* func_0201ca88: reset a record block — zero two header words, then tail-call the
 * clear helper func_020945f4(buf, 0, 64). */
extern int data_0218febc[];
extern char data_0218ff0c[];
extern void func_020945f4(void *, int, int);
void func_0201ca88(void){
    data_0218febc[7] = 0;
    data_0218febc[0] = 0;
    func_020945f4(data_0218ff0c, 0, 64);
}
