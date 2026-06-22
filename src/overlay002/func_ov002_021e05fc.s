; func_ov002_021e05fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bae7c
        .extern func_ov002_021d479c
        .extern func_ov002_021df680
        .extern func_ov002_021df938
        .extern func_ov002_02244fe4
        .extern func_ov002_022538bc
        .global func_ov002_021e05fc
        .arm
func_ov002_021e05fc:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    movs r4, r1
    mov r5, r0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    rsb r6, r5, #0x1
    ldr r1, _LIT0
    mov r0, r6
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    beq .L_5c
    ldr r1, _LIT0
    mov r0, r6
    bl func_ov002_021df680
    ldr r3, _LIT0
    mov r0, r5
    mov r1, r4
    mov r2, #0x1
    bl func_ov002_021df938
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_5c:
    ldr r0, _LIT1
    mov r2, #0x4
    cmp r4, r0
    movgt r4, r0
    cmp r5, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x24
    mov r0, r0, lsl #0x10
    mov r1, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r3, #0x0
    bl func_ov002_021d479c
    ldr r1, [sp]
    mov r0, #0x10000
    bic r2, r1, #0x10000
    mov r1, r5, lsl #0x1f
    orr r1, r2, r1, lsr #0xf
    rsb r0, r0, #0x0
    and r1, r1, r0
    mov r0, r4, lsl #0x10
    orr r1, r1, r0, lsr #0x10
    mov r0, #0x11
    str r1, [sp]
    bl func_ov002_02244fe4
    ldr r1, _LIT2
    mov r0, r5
    mov r2, #0x1
    bl func_ov002_022538bc
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word 0x00001256
_LIT1: .word 0x0000ffff
_LIT2: .word 0x0000144d
