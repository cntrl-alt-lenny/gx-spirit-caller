; func_ov006_021c33b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202160c
        .extern func_0202165c
        .extern func_02034734
        .extern func_020347c0
        .global func_ov006_021c33b4
        .arm
func_ov006_021c33b4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, [r0, #0x8]
    mov r1, #0x5
    mov r2, #0x0
    bl func_0202160c
    mov r4, r0
    bl func_02034734
    cmp r0, #0x0
    beq .L_1844
    ldr r5, _LIT0
    bl func_02034734
    cmp r0, #0x1
    movne r7, #0x1
    moveq r7, #0x0
    bl func_020347c0
    mov r6, r0
    b .L_1850
.L_1844:
    mov r5, #0x0
    mov r7, r5
    mov r6, r5
.L_1850:
    mov r0, r4
    mov r1, #0x3
    mov r2, #0xf8
    bl func_0202165c
    mov r0, r4
    mov r1, #0x4
    mov r2, #0x8
    bl func_0202165c
    mov r0, r4
    mov r1, #0x11
    mov r2, #0x0
    bl func_0202165c
    mov r0, r4
    mov r1, #0x12
    mov r2, #0x0
    bl func_0202165c
    mov r2, r7
    mov r0, r4
    mov r1, #0xc
    bl func_0202165c
    mov r2, r6
    mov r0, r4
    mov r1, #0xd
    bl func_0202165c
    mov r0, r4
    mov r2, r5
    mov r1, #0x0
    bl func_0202165c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x000008c1
