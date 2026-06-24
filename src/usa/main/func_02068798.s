; func_02068798 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101c7c
        .extern func_0206881c
        .extern func_02068888
        .extern func_02068ae0
        .global func_02068798
        .arm
func_02068798:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r9, r0
    add r0, r1, #0x1
    mov r1, #0x5c
    bl func_0206881c
    movs r8, r0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldr r4, _LIT0
    mov r6, #0x0
    mov r5, #0x5c
.L_214:
    mov r0, r6
    mov r1, r5
    bl func_0206881c
    movs r7, r0
    mov r0, r8
    moveq r7, r4
    bl func_02068888
    cmp r0, #0x0
    beq .L_248
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_02068ae0
.L_248:
    mov r0, r6
    mov r1, r5
    bl func_0206881c
    movs r8, r0
    bne .L_214
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_02101c7c
