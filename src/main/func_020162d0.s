; func_020162d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020139b4
        .extern func_020195ec
        .extern func_0201969c
        .extern func_0201b7b4
        .extern func_0201b7e0
        .global func_020162d0
        .arm
func_020162d0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8d8]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x920]
    cmp r0, #0x1
    beq .L_28a4
    cmp r0, #0x2
    beq .L_295c
    ldmia sp!, {r3, r4, r5, pc}
.L_28a4:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_28c8
    b .L_2940
    b .L_2914
    b .L_28d0
.L_28c8:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_28d0:
    bl func_0201969c
    cmp r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020139b4
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT0
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    bl GetSystemWork
    ldr r1, [r0, #0x8f8]
    orr r1, r1, #0x1000
    str r1, [r0, #0x8f8]
    ldmia sp!, {r3, r4, r5, pc}
.L_2914:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195ec
    cmp r0, #0x0
    ldreq r0, _LIT1
    streq r0, [r5, #0x8]
    ldrne r0, _LIT2
    strne r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_2940:
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    bl GetSystemWork
    ldr r1, [r0, #0x8f8]
    bic r1, r1, #0x1000
    str r1, [r0, #0x8f8]
    ldmia sp!, {r3, r4, r5, pc}
.L_295c:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT4
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    bl func_0201b7b4
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00190100
_LIT1: .word 0x00190101
_LIT2: .word 0x00190102
_LIT3: .word 0x00190103
_LIT4: .word 0x00190200
