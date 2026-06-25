; func_ov002_022b93a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0cc
        .extern func_0202e1e0
        .extern func_ov002_022bdd80
        .global func_ov002_022b93a8
        .arm
func_ov002_022b93a8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r0, r5
    mov r4, r2
    mov r6, r3
    bl func_0202e1e0
    cmp r0, #0x0
    bne .L_188
    cmp r6, #0x0
    ldrge ip, [sp, #0x10]
    cmpge ip, #0x0
    blt .L_188
    ldr r0, _LIT0
    mov r1, #0x14
    ldr r2, _LIT1
    and r3, r6, #0x1
    mul r1, ip, r1
    mla r0, r3, r0, r2
    ldr r0, [r1, r0]
    mov r0, r0, lsr #0xa
    tst r0, #0x1
    ldreq r5, _LIT2
.L_188:
    mov r0, r5
    bl func_ov002_022bdd80
    cmp r4, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT3
    bl func_ov002_022bdd80
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0cc
_LIT2: .word 0x00001362
_LIT3: .word 0x00000fa7
