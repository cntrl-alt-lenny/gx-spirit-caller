; func_ov002_021c3cf0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021bae7c
        .extern func_ov002_021bb068
        .global func_ov002_021c3cf0
        .arm
func_ov002_021c3cf0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    rsb r4, r5, #0x1
    ldr r1, _LIT0
    mov r0, r4
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x1340
    bl func_ov002_021bb068
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT1
    mov r0, r4
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT2
    ldr r0, [r0, #0xcec]
    cmp r5, r0
    bne .L_7c
    ldr r0, _LIT3
    bl func_ov002_021bb068
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
.L_7c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x0000137b
_LIT1: .word 0x000017e7
_LIT2: .word data_ov002_022d016c
_LIT3: .word 0x0000135e
