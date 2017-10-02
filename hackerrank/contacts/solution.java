import java.io.*;

public class Solution {
    public static void main(String... args) {
        // Scanner in = new Scanner(System.in);
        // in.nextInt();
        final String filename = "input-01.txt";
        File f = new File(filename);
        try {
            FileReader fr = new FileReader(f.getAbsoluteFile());
            BufferedReader br = new BufferedReader(fr);
            int count = Integer.parseInt(br.readLine());

            Trie trie = new Trie();
            for (int x=0; x < count; x++) {
                String[] parts = br.readLine().split(" ");
                if ("add".equals(parts[0])) {
                    trie.add(parts[1]);
                } else {
                    System.out.println(trie.count(parts[1]));
                }
            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public static class Trie {
        TrieNode root;
        public Trie() {
            this.root = new TrieNode();
        }

        public void add(String word) {
            TrieNode current = this.root;
            for (char ch: word.toCharArray()) {
                if (current.children[getCharIndex(ch)] == null) {
                    current.children[getCharIndex(ch)] = new TrieNode(ch);
                } else {
                    current.children[getCharIndex(ch)].count++;
                }
                current = current.children[getCharIndex(ch)];
            }
        }

        public int count(String keyword) {
            TrieNode current = this.root;
            for (char ch: keyword.toCharArray()) {
                if (current.children[getCharIndex(ch)] == null) {
                    return 0;
                }
                current = current.children[getCharIndex(ch)];
            }
            return current.count;
        }

        public int getCharIndex(Character ch) {
            return ch - 'a';
        }

    }

    public static class TrieNode {
        final int size = 26;

        TrieNode[] children;
        Character data;
        int count;

        public TrieNode() {
            this(null);
        }

        public TrieNode(Character data) {
            this.data = data;
            children = new TrieNode[size];
            count = 1;
        }
    }
}
