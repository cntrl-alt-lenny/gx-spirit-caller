; func_0208977c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207cee0
        .extern func_0207cf0c
        .extern func_0207d994
        .extern func_02089660
        .extern func_02089680
        .global func_0208977c
        .arm
func_0208977c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r8, r0
    mov r5, #0x0
    mov r1, r5
    add r0, r8, #0x4
    bl func_0207cee0
    movs r7, r0
    beq .L_98
    add r9, r8, #0x4
    mov sl, #0x1
    mov r4, r5
.L_2c:
    mov r0, r7
    mov r1, r4
    bl func_0207cee0
    movs r6, r0
    beq .L_78
.L_40:
    ldr ip, [r6, #0xc]
    cmp ip, #0x0
    beq .L_64
    ldr r1, [r6, #0x8]
    ldr r2, [r6, #0x10]
    ldr r3, [r6, #0x14]
    add r0, r6, #0x20
    blx ip
    mov r5, sl
.L_64:
    mov r0, r7
    mov r1, r6
    bl func_0207cee0
    movs r6, r0
    bne .L_40
.L_78:
    mov r0, r9
    mov r1, r7
    bl func_0207cf0c
    mov r0, r9
    mov r1, r4
    bl func_0207cee0
    movs r7, r0
    bne .L_2c
.L_98:
    ldr r0, [r8]
    mov r1, #0x3
    bl func_0207d994
    cmp r5, #0x0
    beq .L_b0
    bl func_02089660
.L_b0:
    mov r0, r8
    bl func_02089680
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
