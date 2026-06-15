; func_0201a920 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02018a84
        .extern func_02018b94
        .global func_0201a920
        .arm
func_0201a920:
    stmdb sp!, {r4, lr}
    cmp r0, #0x20000
    mov r4, #0x0
    bgt .L_394
    cmp r0, #0x20000
    bge .L_3b8
    cmp r0, #0x8000
    bgt .L_388
    ldreq r4, _LIT0
    b .L_3c4
.L_388:
    cmp r0, #0x10000
    ldreq r4, _LIT1
    b .L_3c4
.L_394:
    cmp r0, #0x80000
    bgt .L_3ac
    bge .L_3c0
    cmp r0, #0x40000
    ldreq r4, _LIT2
    b .L_3c4
.L_3ac:
    cmp r0, #0x100000
    ldreq r4, _LIT3
    b .L_3c4
.L_3b8:
    ldr r4, _LIT4
    b .L_3c4
.L_3c0:
    ldr r4, _LIT5
.L_3c4:
    bl func_02018b94
    mov r1, #0x10000
    ldr r2, [r0, #0x18]
    rsb r1, r1, #0x0
    and r2, r2, r1
    mov r1, r4, lsl #0x10
    orr r1, r2, r1, lsr #0x10
    str r1, [r0, #0x18]
    mov r0, r4
    mov r1, #0x1
    bl func_02018a84
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000161d
_LIT1: .word 0x0000154c
_LIT2: .word 0x0000119b
_LIT3: .word 0x000018f6
_LIT4: .word 0x0000132f
_LIT5: .word 0x00001798
