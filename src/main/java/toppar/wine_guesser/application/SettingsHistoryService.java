package toppar.wine_guesser.application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.GameSettings;
import toppar.wine_guesser.domain.SettingsHistory;
import toppar.wine_guesser.repository.SettingsHistoryRepository;

import java.util.List;

@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW, isolation = Isolation.SERIALIZABLE)
@Service
public class SettingsHistoryService {

    @Autowired
    private SettingsHistoryRepository settingsHistoryRepository;

    void saveGameSettings(List<GameSettings> gameSettings){
        gameSettings.forEach(gameSetting -> settingsHistoryRepository.save(new SettingsHistory(gameSetting.getGameSettings_id(), gameSetting.getGameHost(), gameSetting.getGame_id(),
                gameSetting.getQrCode(), gameSetting.getUrl(), gameSetting.getDescription(), gameSetting.getServingOrder())));
    }
}
