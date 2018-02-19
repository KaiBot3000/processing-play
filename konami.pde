string keys = 'start';

void setup() {
    background(120);
    frameRate(4);
}

void draw() {
    boolean codeTyped = keys.endsWith('abc');
    if (codeTyped) {
        background(0);
    }
}

void keyTyped() {
    print(key)
    keys = keys + key;
    println(keys);
}

// first key press prints as letter, rest as ascii(?) ex: '102'

