; func_0203b880 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d388
        .extern func_0203b830
        .global func_0203b880
        .arm
func_0203b880:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, #0x0
    ldr r6, _LIT0
    ldr r8, _LIT1
    mov r4, r7
    mov r5, #0x10000000
.L_940:
    ldrh r0, [r6, #0xb0]
    tst r0, #0x8000
    beq .L_984
    mov r0, r6
    bl func_0203b830
    ldrh r1, [r6, #0xb0]
    tst r1, #0x2000
    mulne r1, r0, r8
    bne .L_978
    ldrh r2, [r6, #0xb2]
    ldr r1, [r6, #0x74]
    mul r2, r0, r2
    ldrh r0, [r1, #0x1e]
    mul r1, r2, r0
.L_978:
    cmp r1, r5
    movlt r5, r1
    movlt r7, r6
.L_984:
    add r4, r4, #0x1
    cmp r4, #0x8
    add r6, r6, #0xc4
    blt .L_940
    mov r0, r7
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_0219d388
_LIT1: .word 0x00005b48
