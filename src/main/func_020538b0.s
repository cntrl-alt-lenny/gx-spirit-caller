; func_020538b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffad8
        .extern data_0219e474
        .extern data_0219e47c
        .extern func_020a7440
        .global func_020538b0
        .arm
func_020538b0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    cmp r1, #0x7
    mov r6, r2
    mov r4, r3
    movlt r0, #0x1
    ldmltia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT0
    add r0, r6, #0x4
    mov r2, #0x4
    bl func_020a7440
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT1
    ldrh r1, [r6, #0x2]
    ldrh r0, [r0, #0x6]
    cmp r1, r0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT2
    mov r0, r5
    mov r2, #0x3
    bl func_020a7440
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    ldrsb r2, [r5, #0x3]
    ldrsb r0, [r5, #0x4]
    ldrsb r1, [r5, #0x5]
    mov r3, r2, lsl #0x18
    mov r2, r0, lsl #0x10
    ldrsb r0, [r5, #0x6]
    mov r1, r1, lsl #0x8
    and r3, r3, #-16777216
    and r2, r2, #0xff0000
    orr r2, r3, r2
    and r1, r1, #0xff00
    orr r1, r2, r1
    and r0, r0, #0xff
    orr r0, r1, r0
    str r0, [r4]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219e47c
_LIT1: .word data_0219e474
_LIT2: .word data_020ffad8
