; func_0201a8e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02018a50
        .extern func_02018b60
        .global func_0201a8e0
        .arm
func_0201a8e0:
    stmdb sp!, {r4, lr}
    cmp r0, #0x20000
    mov r4, #0x0
    bgt .L_108
    cmp r0, #0x20000
    bge .L_12c
    cmp r0, #0x8000
    bgt .L_fc
    ldreq r4, _LIT0
    b .L_138
.L_fc:
    cmp r0, #0x10000
    ldreq r4, _LIT1
    b .L_138
.L_108:
    cmp r0, #0x80000
    bgt .L_120
    bge .L_134
    cmp r0, #0x40000
    ldreq r4, _LIT2
    b .L_138
.L_120:
    cmp r0, #0x100000
    ldreq r4, _LIT3
    b .L_138
.L_12c:
    ldr r4, _LIT4
    b .L_138
.L_134:
    ldr r4, _LIT5
.L_138:
    bl func_02018b60
    mov r1, #0x10000
    ldr r2, [r0, #0x18]
    rsb r1, r1, #0x0
    and r2, r2, r1
    mov r1, r4, lsl #0x10
    orr r1, r2, r1, lsr #0x10
    str r1, [r0, #0x18]
    mov r0, r4
    mov r1, #0x1
    bl func_02018a50
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000161d
_LIT1: .word 0x0000154c
_LIT2: .word 0x0000119b
_LIT3: .word 0x000018f6
_LIT4: .word 0x0000132f
_LIT5: .word 0x00001798
