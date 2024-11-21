import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RetrievePosts extends StatelessWidget {
  final firebase = FirebaseFirestore.instance.collection("riphah");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Retrieve Posts"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firebase.snapshots(), // Stream multiple records
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                "No posts available",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          final posts = snapshot.data!.docs;

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  onTap: () {
                    _showUpdateDialog(context, post);
                  },
                  title: Text(
                    post['title'],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("ID: ${post['id']}"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      _confirmDelete(context, post.id);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showUpdateDialog(BuildContext context, QueryDocumentSnapshot post) {
    final TextEditingController _updateController =
    TextEditingController(text: post['title']);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Update Post"),
        content: TextField(
          controller: _updateController,
          decoration: InputDecoration(
            labelText: "New Title",
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
            },
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await firebase.doc(post.id).update({
                  "title": _updateController.text,
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Post updated successfully!"),
                    backgroundColor: Colors.green,
                  ),
                );
              } catch (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Failed to update post."),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Text("Update"),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context, String postId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Delete Post"),
        content: Text("Are you sure you want to delete this post?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
            },
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await firebase.doc(postId).delete();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Post deleted successfully!"),
                    backgroundColor: Colors.green,
                  ),
                );
              } catch (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Failed to delete post."),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Text("Delete"),
          ),
        ],
      ),
    );
  }
}
