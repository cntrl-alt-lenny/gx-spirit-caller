unsigned int func_02078d88(unsigned int index, unsigned int *state)
{
    unsigned int word = state[(index+13)&15] ^ state[index^8] ^ state[(index+2)&15] ^ state[index];
    state[index] = (word << 1) | (word >> 31);
    return state[index];
}
