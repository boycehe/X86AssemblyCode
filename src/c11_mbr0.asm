start:
    mov ax, 0xb800
    mov ds, ax

    mov byte [0x00], 'H'
    mov byte [0x01], 0x04

    mov byte [0x02], 'e'
    mov byte [0x03], 0x04 
    
    mov byte [0x04], 'l'
    mov byte [0x05], 0x04

    mov byte [0x06], 'l'
    mov byte [0x07], 0x04

    mov byte [0x08], 'o'
    mov byte [0x09], 0x04

    mov byte [0x0a], ' '
    mov byte [0x0b], 0x04

    mov byte [0x0c], 'W'
    mov byte [0x0d], 0x04

    mov byte [0x0e], 'o'
    mov byte [0x0f], 0x04

    mov byte [0x10], 'r'
    mov byte [0x11], 0x04

    mov byte [0x12], 'l'
    mov byte [0x13], 0x04

    mov byte [0x14], 'd'
    mov byte [0x15], 0x04

    mov byte [0x16], '!'
    mov byte [0x17], 0x04

again:
    jmp again

blank:
    times 510 - (blank - start) db 0
    db 0x55,0xaa



