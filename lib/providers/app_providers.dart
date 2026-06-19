import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/call_models.dart';
import '../services/claude_service.dart';
import '../services/voice_service.dart';
import '../services/database_service.dart';

final claudeServiceProvider = Provider<ClaudeService>((ref) => ClaudeService());

final voiceServiceProvider = Provider<VoiceService>((ref) {
  final service = VoiceService();
  ref.onDispose(() => service.dispose());
  return service;
});

final databaseServiceProvider = Provider<DatabaseService>((ref) => DatabaseService());

class CallHistoryNotifier extends StateNotifier<List<CallRecord>> {
  final DatabaseService _db;

  CallHistoryNotifier(this._db) : super([]) {
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final calls = await _db.getAllCalls();
    state = calls;
  }

  Future<void> addOrUpdateCall(CallRecord call) async {
    await _db.saveCall(call);
    final existingIndex = state.indexWhere((c) => c.id == call.id);
    if (existingIndex >= 0) {
      final updated = [...state];
      updated[existingIndex] = call;
      state = updated;
    } else {
      state = [call, ...state];
    }
  }

  Future<void> deleteCall(String id) async {
    await _db.deleteCall(id);
    state = state.where((c) => c.id != id).toList();
  }

  Future<void> clearAll() async {
    await _db.deleteAll();
    state = [];
  }
}

final callHistoryProvider = StateNotifierProvider<CallHistoryNotifier, List<CallRecord>>((ref) {
  return CallHistoryNotifier(ref.watch(databaseServiceProvider));
});

final activeCallProvider = StateProvider<CallRecord?>((ref) => null);