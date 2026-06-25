; func_02017a64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02013990
        .extern func_02019000
        .extern func_020190b8
        .global func_02017a64
        .arm
func_02017a64:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl GetSystemWork
    mov r5, r0
    ldr r0, [r5, #0x8d8]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x920]
    cmp r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020190b8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02013990
    cmp r0, #0x5
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019000
    ldr r1, [r5, #0x8dc]
    add r1, r1, #0x1
    cmp r0, r1
    ldrcs r0, _LIT0
    strcs r0, [r4, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00240100
