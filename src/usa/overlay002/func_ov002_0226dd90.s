; func_ov002_0226dd90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b9dec
        .extern func_ov002_021bc7e8
        .extern func_ov002_021bcca0
        .global func_ov002_0226dd90
        .arm
func_ov002_0226dd90:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mvn r1, #0x0
    mov sl, r0
    bl func_ov002_021bcca0
    cmp r0, #0x2
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r5, _LIT0
    mov r9, #0x0
    mov r6, r9
    add r4, r5, #0x2
.L_2fc:
    mov r8, r6
    eor r7, sl, r9
.L_304:
    mov r0, sl
    mov r1, r7
    mov r2, r8
    bl func_ov002_021bc7e8
    cmp r0, #0x0
    beq .L_33c
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9dec
    cmp r0, r5
    cmpne r0, r4
    bne .L_33c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_33c:
    add r8, r8, #0x1
    cmp r8, #0x4
    ble .L_304
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_2fc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x000013e5
