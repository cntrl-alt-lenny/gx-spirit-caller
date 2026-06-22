; func_ov002_021d50fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021b8fcc
        .extern func_ov002_021bc6c4
        .extern func_ov002_021bd030
        .extern func_ov002_021c10e8
        .extern func_ov002_021c1954
        .extern func_ov002_021d7054
        .extern func_ov002_021de480
        .global func_ov002_021d50fc
        .arm
func_ov002_021d50fc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r1
    bl func_ov002_021c1954
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT0
    ldr r1, _LIT1
    and r2, r7, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mla r0, r6, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_2fc
    mov r0, r7
    mov r1, r6
    mov r2, #0x0
    bl func_ov002_021c10e8
    mov r4, r0
    cmp r4, r7
    beq .L_2fc
    bl func_ov002_021bc6c4
    mov r5, r0
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b8fcc
    cmp r0, #0x0
    beq .L_270
    rsb r0, r7, #0x1
    bl func_ov002_021bd030
    cmp r0, #0x0
    mvnlt r5, #0x0
.L_270:
    mvn r0, #0x0
    cmp r5, r0
    bne .L_294
    mov r0, r7
    mov r1, r6
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_021de480
    b .L_2f4
.L_294:
    ldr ip, _LIT2
    ldr r0, [ip, #0xd40]
    add r0, r0, #0x1
    str r0, [ip, #0xd40]
    cmp r0, #0xa
    bcc .L_2c8
    mov r2, #0x0
    mov r0, r7
    mov r1, r6
    mov r3, r2
    str r2, [ip, #0xd40]
    bl func_ov002_021de480
    b .L_2f4
.L_2c8:
    and r1, r7, #0xff
    and r0, r6, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    and r2, r4, #0xff
    and r1, r5, #0xff
    orr r1, r2, r1, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d7054
.L_2f4:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2fc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022d016c
