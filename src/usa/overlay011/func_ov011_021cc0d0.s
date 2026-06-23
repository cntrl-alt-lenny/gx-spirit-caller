; func_ov011_021cc0d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d4030
        .extern func_0201e798
        .extern func_0201e7ac
        .extern func_0201ea4c
        .extern func_0207fc40
        .global func_ov011_021cc0d0
        .arm
func_ov011_021cc0d0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x20
    ldr r4, _LIT0
    mov r8, r0
    mov r7, r1
    mvn r0, #0x0
    mov r6, r2
    mov r5, r3
    cmp r7, r0
    ldr r4, [r4, r8, lsl #0x2]
    beq .L_3c
    mov r1, r7, lsl #0x10
    mov r0, r4
    mov r1, r1, lsr #0x10
    bl func_0201e7ac
.L_3c:
    mov ip, #0x0
    ldr r0, [sp, #0x44]
    str ip, [sp]
    stmib sp, {r0, r5, r6, ip}
    ldr r0, [sp, #0x40]
    ldr r1, [sp, #0x3c]
    mov r0, r0, lsl #0x10
    str ip, [sp, #0x14]
    str r1, [sp, #0x18]
    mov r3, r0, lsr #0x10
    ldr r2, [sp, #0x38]
    mov r1, r4
    mov r0, #0x1
    str ip, [sp, #0x1c]
    bl func_0201ea4c
    mvn r0, #0x0
    cmp r7, r0
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r4
    mov r1, #0x1
    bl func_0201e798
    cmp r8, #0x1
    cmpne r8, #0x2
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r4
    mov r1, #0x1000
    bl func_0207fc40
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov011_021d4030
