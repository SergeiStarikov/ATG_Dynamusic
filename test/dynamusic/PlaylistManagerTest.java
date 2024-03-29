package dynamusic;

import atg.adapter.gsa.GSARepository;
import atg.repository.MutableRepository;
import atg.repository.RepositoryException;
import org.junit.Before;
import org.junit.Test;

/**
 * Class for testing PlaylistManager
 */
public class PlaylistManagerTest {
    private PlaylistManager playlistManager = new PlaylistManager();

    private MutableRepository userRepository = new GSARepository();

    @Before
    public void setUp() throws Exception {
        playlistManager.setUserRepository(userRepository);
    }

    @Test(expected = RepositoryException.class)
    public void shouldThrowRepositoryExceptionWhenUserIdIsNull() throws Exception {
        playlistManager.addPlaylistToUser(null, null);
    }

}